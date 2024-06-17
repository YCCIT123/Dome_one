//
//  ThirdViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let LabelOne = UILabel()
    let LabelSecond = UILabel()
    let TextFieldOne = UITextField()
    let ButtonOne = UIButton(type: .system)
    let ButtonSecond = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "发现"
        
        LabelOne.text = "PageThird"
        LabelOne.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        LabelOne.textAlignment = .center
        view.addSubview(LabelOne)
        
        let imageView = UIImageView(image: UIImage(named: "UserImage"))
        imageView.frame = CGRect(x: (view.frame.width-100)/2, y: 300, width: 100, height: 100)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        view.addSubview(imageView)
        
        LabelSecond.text = "1234"
        LabelSecond.frame = CGRect(x: 0, y: 450, width: view.frame.width, height: 30)
        LabelSecond.textAlignment = .center
        LabelSecond.textColor = .red
        view.addSubview(LabelSecond)
        
        TextFieldOne.placeholder = "输入数字或其他"
        TextFieldOne.frame = CGRect(x: (view.frame.width-300)/2, y: 500, width: 300, height: 50)
        TextFieldOne.borderStyle = .roundedRect
        view.addSubview(TextFieldOne)
        
        ButtonOne.setTitle("获取数据", for: .normal)
        ButtonOne.backgroundColor = .blue
        ButtonOne.tintColor = .white
        ButtonOne.frame = CGRect(x: (view.frame.width-300)/2, y: 600, width: 300, height: 50)
        ButtonOne.addTarget(self, action: #selector(getMessage), for: .touchUpInside)
        ButtonOne.layer.masksToBounds = true
        ButtonOne.layer.cornerRadius = 10
        view.addSubview(ButtonOne)
        
    }
    
    @objc func getMessage(){
        if (TextFieldOne.text != ""){
            LabelSecond.text = TextFieldOne.text
        }
    }
}
 
