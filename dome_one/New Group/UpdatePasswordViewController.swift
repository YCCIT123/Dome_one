//
//  UpdatePasswordViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/12.
//

import UIKit

protocol UpdatePasswordDelegate: AnyObject{
    func updatePassword(title:String?)
}

class UpdatePasswordViewController: UIViewController {
    
    weak var delegate: UpdatePasswordDelegate?

    let stackView = UIStackView()
    let switchButton = UISwitch()
    
    let nameLabel = UILabel()
    
    let updateTextField = UITextField()
    
    let updateButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "更新密码"
        
        nameLabel.text = "请输入新密码"

        
        updateTextField.placeholder = "请输入新密码"
        updateTextField.borderStyle = .roundedRect
        
        switchButton.isOn = false
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(updateTextField)
        stackView.addArrangedSubview(updateButton)
        stackView.addArrangedSubview(switchButton)
        
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.alignment = .center
        
        updateButton.setTitle("确认更新", for: .normal)
        updateButton.tintColor = .white
        updateButton.backgroundColor = .blue
        updateButton.layer.masksToBounds = true
        updateButton.layer.cornerRadius = 10
        updateButton.addTarget(self, action: #selector(ShowAlert), for: .touchUpInside)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            updateTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            updateTextField.heightAnchor.constraint(equalToConstant: 50),
            
            updateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    @objc func ShowAlert(){
        let alertController = UIAlertController(title: "更新", message: "是否更新密码", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: {
            _ in self.TryDelegate()
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(alertController,animated: true,completion: nil)
    }
    
    func TryDelegate(){
        delegate?.updatePassword(title: updateTextField.text)
        ShowBoolAlert()
    }
    
    func ShowBoolAlert(){
        let  alretBool = UIAlertController(title: "恭喜", message: "更新成功", preferredStyle: .alert)
        alretBool.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
        alretBool.addAction(UIAlertAction(title: "返回上一页", style: .default, handler: { _ in
            self.GoBack()
        }))
        present(alretBool,animated: true,completion: nil)
        updateTextField.text = ""
    }
    
    func GoBack(){
        navigationController?.popToRootViewController(animated: true)
    }
}
