import UIKit

/** 竖直连续滚动文字控件（无停顿、循环滚动，适合数字、公告等场景）*/
protocol VerticalScrollTextViewDelegate: AnyObject {
    /** 当前滚动到的索引回调 */
    func verticalScrollText(_ scrollText: VerticalScrollTextView, currentTextIndex index: Int)
}

class VerticalScrollTextView: UIView {
    
    // MARK: Public Properties
    /** 代理 */
    weak var delegate: VerticalScrollTextViewDelegate?
    /** 滚动内容数组（支持富文本） */
    var textDataArr: [NSAttributedString] = [] {
        didSet { index = 0 }
    }
    /** 字体 */
    var textFont: UIFont = .systemFont(ofSize: 12) {
        didSet { labels.forEach { $0.font = textFont } }
    }
    /** 字体颜色 */
    var textColor: UIColor = .black {
        didSet { labels.forEach { $0.textColor = textColor } }
    }
    /** 对齐方式 */
    var textAlignment: NSTextAlignment = .left {
        didSet { labels.forEach { $0.textAlignment = textAlignment } }
    }
    /** 单次滚动动画时长（秒），数值越小滚动越快 */
    var scrollAnimationTime: TimeInterval = 1.0
    
    // MARK: - Private Properties
    
    /** 内部3个label，循环复用实现无缝滚动 */
    private var labels: [UILabel] = []
    /** 当前显示的内容索引 */
    private var index = 0
    /** 是否正在滚动 */
    private var isRunning = false
    /** 是否需要停止 */
    private var needStop = false
    /** 滚动方向（1: bottom-to-top, -1: top-to-bottom） */
    private var direction: Int = 1
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    // MARK: - Setup
    /** 初始化控件和label */
    private func initialSetup() {
        clipsToBounds = true
        for _ in 0..<3 {
            let label = createLabel()
            addSubview(label)
            labels.append(label)
        }
    }
    
    /** 创建label的工厂方法 */
    private func createLabel() -> UILabel {
        let label = UILabel(frame: bounds)
        label.font = textFont
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = 1
        return label
    }
}

// MARK: - Action
extension VerticalScrollTextView {
    /** 启动自下而上无停顿滚动 */
    func startContinuousScrollBottomToTop() {
        startContinuousScroll(direction: 1)
    }
    /** 启动自上而下无停顿滚动 */
    func startContinuousScrollTopToBottom() {
        startContinuousScroll(direction: -1)
    }
    /** 停止滚动（动画自然结束） */
    func stop() {
        needStop = true
    }
    /** 停止并清空内容 */
    func stopToEmpty() {
        needStop = true
        resetStateToEmpty()
    }
    /** 启动滚动（direction: 1为向上，-1为向下） */
    private func startContinuousScroll(direction: Int) {
        stop()
        guard !isRunning else {
            /** 如果正在滚动，延迟重试，避免动画冲突 */
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.startContinuousScroll(direction: direction)
            }
            return
        }
        self.direction = direction
        resetStateToEmpty()
        layoutLabelsForStart()
        isRunning = true
        continuousScrollAnimation()
    }
}

// MARK: - UI
extension VerticalScrollTextView {
    /** 重置控件状态和label */
    private func resetStateToEmpty() {
        labels.forEach { $0.removeFromSuperview() }
        labels.removeAll()
        for _ in 0..<3 {
            let label = createLabel()
            addSubview(label)
            labels.append(label)
        }
        index = 0
        needStop = false
        isRunning = false
    }
    /** 初始布局3个label，分别为上一个、当前、下一个 */
    private func layoutLabelsForStart() {
        guard textDataArr.count > 0 else { return }
        let h = bounds.height
        for i in 0..<3 {
            let label = labels[i]
            let idx = (index + i - 1 + textDataArr.count) % textDataArr.count
            label.frame = CGRect(x: 0, y: CGFloat(i - 1) * h, width: bounds.width, height: h)
            label.attributedText = textDataArr[idx]
        }
    }
}

// MARK: - Animation
extension VerticalScrollTextView {
    /** 连续滚动动画主循环（无停顿） */
    private func continuousScrollAnimation() {
        guard !needStop, textDataArr.count > 0 else { isRunning = false; return }
        isRunning = true
        delegate?.verticalScrollText(self, currentTextIndex: index)
        UIView.animate(withDuration: scrollAnimationTime, delay: 0, options: .curveLinear, animations: {
            for label in self.labels {
                label.frame.origin.y -= CGFloat(self.direction) * self.bounds.height
            }
        }, completion: { _ in
            if self.direction == 1 {
                // 向上滚动：最上方label复用到最下方
                let first = self.labels.removeFirst()
                let newIdx = (self.index + 2) % self.textDataArr.count
                first.frame.origin.y = self.labels.last!.frame.origin.y + self.bounds.height
                first.attributedText = self.textDataArr[newIdx]
                self.labels.append(first)
                self.index = (self.index + 1) % self.textDataArr.count
            } else {
                // 向下滚动：最下方label复用到最上方
                let last = self.labels.removeLast()
                let newIdx = (self.index + self.textDataArr.count - 2) % self.textDataArr.count
                last.frame.origin.y = self.labels.first!.frame.origin.y - self.bounds.height
                last.attributedText = self.textDataArr[newIdx]
                self.labels.insert(last, at: 0)
                self.index = (self.index + 1) % self.textDataArr.count
            }
            if self.needStop {
                self.isRunning = false
            } else {
                self.continuousScrollAnimation()
            }
        })
    }
    /** 强制显示最后一项内容（用于滚动停止后确保显示目标内容） */
    func showFinalState() {
        guard textDataArr.count > 0 else { return }
        for (i, label) in labels.enumerated() {
            label.frame = CGRect(x: 0, y: CGFloat(i - 1) * bounds.height, width: bounds.width, height: bounds.height)
            label.attributedText = textDataArr.last
        }
        index = textDataArr.count - 1
    }
}

// MARK: 调用方法
//import UIKit
//
//class ViewController: UIViewController, VerticalScrollTextViewDelegate, UITextFieldDelegate {
//    private var scrollTextView: VerticalScrollTextView!
//      private var inputField: UITextField!
//      private var setButton: UIButton!
//      private var stopTimer: Timer?
//      
//      override func viewDidLoad() {
//          super.viewDidLoad()
//          view.backgroundColor = .white
//          
//          // 输入框
//          inputField = UITextField(frame: CGRect(x: 40, y: 80, width: 100, height: 36))
//          inputField.borderStyle = .roundedRect
//          inputField.placeholder = "输入位数"
//          inputField.keyboardType = .numberPad
//          inputField.delegate = self
//          view.addSubview(inputField)
//          
//          // 按钮
//          setButton = UIButton(type: .system)
//          setButton.frame = CGRect(x: 150, y: 80, width: 80, height: 36)
//          setButton.setTitle("设置", for: .normal)
//          setButton.addTarget(self, action: #selector(setButtonTapped), for: .touchUpInside)
//          view.addSubview(setButton)
//          
//          // 滚动控件
//          createAndAddScrollTextView()
//          
//          // 默认内容
//          updateScrollTextData(digits: 3)
//          scrollTextView.startContinuousScrollBottomToTop()
//      }
//      
//      private func createAndAddScrollTextView() {
//          // 移除旧的控件
//          scrollTextView?.removeFromSuperview()
//          scrollTextView = VerticalScrollTextView(frame: CGRect(x: 40, y: 140, width: view.bounds.width - 80, height: 40))
//          scrollTextView.textFont = .boldSystemFont(ofSize: 28)
//          scrollTextView.textColor = .systemBlue
//          scrollTextView.textAlignment = .center
//          scrollTextView.scrollAnimationTime = 0.1
//          scrollTextView.delegate = self
//          view.addSubview(scrollTextView)
//          // 停止计时器
//          stopTimer?.invalidate()
//          stopTimer = nil
//      }
//      
//      // 只允许输入数字
//      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//          let allowed = CharacterSet.decimalDigits
//          return string.isEmpty || string.rangeOfCharacter(from: allowed) != nil
//      }
//      
//      @objc private func setButtonTapped() {
//          inputField.resignFirstResponder()
//          guard let text = inputField.text, let digits = Int(text), digits > 0, digits <= 10 else {
//              let alert = UIAlertController(title: "请输入1-10的数字", message: nil, preferredStyle: .alert)
//              alert.addAction(UIAlertAction(title: "OK", style: .default))
//              present(alert, animated: true)
//              return
//          }
//          // 彻底移除旧控件和状态
//          createAndAddScrollTextView()
//          updateScrollTextData(digits: digits)
//          scrollTextView.startContinuousScrollBottomToTop()
//          // 3秒后自动停止
//          stopTimer?.invalidate()
//          stopTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
//              self?.scrollTextView.stop()
//          }
//      }
//      
//      private func updateScrollTextData(digits: Int) {
//          let numbers = (0...9).map { String(repeating: "\($0)", count: digits) }
//          scrollTextView.textDataArr = numbers.map { NSAttributedString(string: $0) }
//      }
//      
//      // MARK: - VerticalScrollTextViewDelegate
//      func verticalScrollText(_ scrollText: VerticalScrollTextView, currentTextIndex index: Int) {
//          // 不再需要轮询停止逻辑
//      }
//      
//      func verticalScrollText(_ scrollText: VerticalScrollTextView, clickIndex index: Int, content: String) {
//          let alert = UIAlertController(title: "点击了第\(index)条", message: content, preferredStyle: .alert)
//          alert.addAction(UIAlertAction(title: "OK", style: .default))
//          present(alert, animated: true)
//      }
//  }
