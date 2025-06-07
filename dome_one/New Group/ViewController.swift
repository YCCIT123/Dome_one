import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    private var numberScrollView: VerticalNumberScrollView!
    private var number1ScrollView: VerticalNumberScrollView!
    private var inputA: UITextField!
    private var inputB: UITextField!
    private var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        // 初始展示A
        let aValue = Double(inputA?.text ?? "") ?? 0
        numberScrollView.setInitialValue(aValue, format: inputA?.text)
        number1ScrollView.setInitialValue(aValue, format: inputA?.text)
    }
    
    private func setupUI() {
        // 输入A
        inputA = UITextField(frame: CGRect(x: 40, y: 100, width: 120, height: 36))
        inputA.borderStyle = .roundedRect
        inputA.placeholder = "输入A数字"
        inputA.keyboardType = .decimalPad
        inputA.text = "1777423"
        inputA.delegate = self
        view.addSubview(inputA)
        
        // 输入B
        inputB = UITextField(frame: CGRect(x: 180, y: 100, width: 120, height: 36))
        inputB.borderStyle = .roundedRect
        inputB.placeholder = "输入B数字"
        inputB.keyboardType = .decimalPad
        inputB.delegate = self
        inputB.text = "2342.12" // 默认值
        view.addSubview(inputB)
        
        // 按钮
        startButton = UIButton(type: .system)
        startButton.frame = CGRect(x: 320, y: 100, width: 80, height: 36)
        startButton.setTitle("开始滚动", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        // 滚动控件
        numberScrollView = VerticalNumberScrollView(frame: CGRect(x: 40, y: 180, width: 360, height: 60))
        numberScrollView.textFont = .boldSystemFont(ofSize: 36)
        numberScrollView.textColor = .systemBlue
        numberScrollView.textAlignment = .center
        numberScrollView.scrollDirection = .up
        numberScrollView.scrollAnimationTime = 0.05
        
        number1ScrollView = VerticalNumberScrollView(frame: CGRect(x: 40, y: 300, width: 360, height: 60))
        number1ScrollView.textFont = .boldSystemFont(ofSize: 36)
        number1ScrollView.textColor = .systemBlue
        number1ScrollView.textAlignment = .center
        number1ScrollView.scrollDirection = .down
        number1ScrollView.scrollAnimationTime = 0.05
        
        view.addSubview(numberScrollView)
        view.addSubview(number1ScrollView)
    }
    
    @objc private func startButtonTapped() {
        inputA.resignFirstResponder()
        inputB.resignFirstResponder()
        guard let bText = inputB.text, let bValue = Double(bText) else {
            let alert = UIAlertController(title: "请输入有效的B数字", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        numberScrollView.startScroll(to: bValue, format: inputB.text)
        number1ScrollView.startScroll(to: bValue, format: inputB.text)
    }
    
    // 只允许输入数字和小数点
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowed = CharacterSet(charactersIn: "0123456789.")
        return string.isEmpty || string.rangeOfCharacter(from: allowed) != nil
    }
}
