import UIKit

class ViewController: UIViewController, VerticalScrollTextViewDelegate, UITextFieldDelegate {
    private var scrollTextView: VerticalScrollTextView!
      private var inputField: UITextField!
      private var setButton: UIButton!
      private var stopTimer: Timer?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .white
          
          // 输入框
          inputField = UITextField(frame: CGRect(x: 40, y: 80, width: 100, height: 36))
          inputField.borderStyle = .roundedRect
          inputField.placeholder = "输入位数"
          inputField.keyboardType = .numberPad
          inputField.delegate = self
          view.addSubview(inputField)
          
          // 按钮
          setButton = UIButton(type: .system)
          setButton.frame = CGRect(x: 150, y: 80, width: 80, height: 36)
          setButton.setTitle("设置", for: .normal)
          setButton.addTarget(self, action: #selector(setButtonTapped), for: .touchUpInside)
          view.addSubview(setButton)
          
          // 滚动控件
          createAndAddScrollTextView()
          
          // 默认内容
          updateScrollTextData(digits: 3)
          scrollTextView.startContinuousScrollBottomToTop()
      }
      
      private func createAndAddScrollTextView() {
          // 移除旧的控件
          scrollTextView?.removeFromSuperview()
          scrollTextView = VerticalScrollTextView(frame: CGRect(x: 40, y: 140, width: view.bounds.width - 80, height: 40))
          scrollTextView.textFont = .boldSystemFont(ofSize: 28)
          scrollTextView.textColor = .systemBlue
          scrollTextView.textAlignment = .center
          scrollTextView.scrollAnimationTime = 0.1
          scrollTextView.delegate = self
          view.addSubview(scrollTextView)
          // 停止计时器
          stopTimer?.invalidate()
          stopTimer = nil
      }
      
      // 只允许输入数字
      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let allowed = CharacterSet.decimalDigits
          return string.isEmpty || string.rangeOfCharacter(from: allowed) != nil
      }
      
      @objc private func setButtonTapped() {
          inputField.resignFirstResponder()
          guard let text = inputField.text, let digits = Int(text), digits > 0, digits <= 10 else {
              let alert = UIAlertController(title: "请输入1-10的数字", message: nil, preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default))
              present(alert, animated: true)
              return
          }
          // 彻底移除旧控件和状态
          createAndAddScrollTextView()
          updateScrollTextData(digits: digits)
          scrollTextView.startContinuousScrollBottomToTop()
          // 3秒后自动停止
          stopTimer?.invalidate()
          stopTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
              self?.scrollTextView.stop()
          }
      }
      
      private func updateScrollTextData(digits: Int) {
          let numbers = (0...9).map { String(repeating: "\($0)", count: digits) }
          scrollTextView.textDataArr = numbers.map { NSAttributedString(string: $0) }
      }
      
      // MARK: - VerticalScrollTextViewDelegate
      func verticalScrollText(_ scrollText: VerticalScrollTextView, currentTextIndex index: Int) {
          // 不再需要轮询停止逻辑
      }
      
      func verticalScrollText(_ scrollText: VerticalScrollTextView, clickIndex index: Int, content: String) {
          let alert = UIAlertController(title: "点击了第\(index)条", message: content, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default))
          present(alert, animated: true)
      }
  }
