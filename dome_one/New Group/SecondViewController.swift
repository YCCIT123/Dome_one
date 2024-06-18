//
//  SecondViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit

class SecondViewController: UIViewController, UpdatePasswordDelegate{
    
    func updatePassword(title: String?) {
        if let title = title {
            passwordLabel.text = title
        }else{
            passwordLabel.text = "没有输入"
        }
    }
    
    let mainView = UIView()
    
    let stackView = UIStackView()

    let passwordNameLabel = UILabel()
    let passwordLabel = UILabel()
    
    let updateButton = UIButton(type: .system)
    let settingButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "联系人"
        
        view.backgroundColor = .red
        
        mainView.backgroundColor = .white
        
        passwordNameLabel.text = "密码:"
        passwordLabel.text = "我是默认密码"
        
        stackView.addArrangedSubview(passwordNameLabel)
        stackView.addArrangedSubview(passwordLabel)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        
        updateButton.setTitle("更新密码", for: .normal)
        updateButton.backgroundColor = .blue
        updateButton.tintColor = .white
        updateButton.layer.masksToBounds = true
        updateButton.layer.cornerRadius = 10
        updateButton.addTarget(self, action: #selector(goToUpadtePage), for: .touchUpInside)

        settingButton.setTitle("设置", for: .normal)
        settingButton.backgroundColor = .blue
        settingButton.tintColor = .white
        settingButton.layer.masksToBounds = true
        settingButton.layer.cornerRadius = 10
        settingButton.addTarget(self, action: #selector(goToSettingPage), for: .touchUpInside)
        
        
        mainView.addSubview(stackView)
        mainView.addSubview(updateButton)
        mainView.addSubview(settingButton)
        view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
            stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20),
            
            updateButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            updateButton.topAnchor.constraint(equalTo: stackView.topAnchor,constant: 50),
            updateButton.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            
            settingButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            settingButton.topAnchor.constraint(equalTo: updateButton.bottomAnchor,constant: 50),
            settingButton.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
            settingButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])

       
    }
    
    @objc func goToUpadtePage(){
        let updatePasswordViewController = UpdatePasswordViewController()
        updatePasswordViewController.hidesBottomBarWhenPushed = true
        updatePasswordViewController.delegate = self
        navigationController?.pushViewController(updatePasswordViewController, animated: false)
    }
    
    @objc func goToSettingPage(){
//        let settingViewController = SettingViewController()
//        settingViewController.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(settingViewController, animated: false)
        let toolViewController = ToolViewController()
        toolViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(toolViewController, animated: false)
    }
    
}
