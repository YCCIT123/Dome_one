//
//  FourViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

//import UIKit
//
//class FourViewController: UIViewController {
//    
//    let scrollView = UIScrollView()
//    let headView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationItem.title = "个人"
//        
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        
//        headView.backgroundColor = .blue
//        headView.translatesAutoresizingMaskIntoConstraints = false
//        
//        scrollView.addSubview(headView)
//        view.addSubview(scrollView)
//        
//        NSLayoutConstraint.activate([
//            
//            
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            
//            
//            headView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
//            headView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            headView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            headView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            headView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            headView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
//            
//            
//        ])
//        
//        // 设置 scrollView 的 contentSize 为 headView 的大小
////        scrollView.contentSize = headView.bounds.size
//    }
//}

import UIKit

class FourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个按钮
        let button = UIButton(type: .system)
        button.setTitle("显示选择界面", for: .normal)
        button.addTarget(self, action: #selector(showHalfScreenView), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }
    
    @objc func showHalfScreenView() {
        // 创建并显示占据屏幕一半高度的视图控制器
        let halfScreenVC = HalfScreenViewController()
        halfScreenVC.modalPresentationStyle = .overFullScreen
        present(halfScreenVC, animated: true, completion: nil)
    }
}

class HalfScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置背景色和透明度
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        // 添加一个占据屏幕一半高度的白色背景视图
        let halfHeight = UIScreen.main.bounds.height / 2
        let contentView = UIView(frame: CGRect(x: 0, y: view.bounds.height - halfHeight, width: view.bounds.width, height: halfHeight))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10 // 设置圆角半径
        view.addSubview(contentView)
        
        // 添加导航标题
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: contentView.bounds.width, height: 30))
        titleLabel.text = "选择界面"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentView.addSubview(titleLabel)
        
        // 添加返回按钮
        let backButton = UIButton(type: .system)
        backButton.setTitle("返回", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        backButton.setTitleColor(.black, for: .normal)
        backButton.frame = CGRect(x: 20, y: 20, width: 60, height: 30)
        backButton.addTarget(self, action: #selector(dismissHalfScreen), for: .touchUpInside)
        contentView.addSubview(backButton)
    }
    
    @objc func dismissHalfScreen() {
        dismiss(animated: true, completion: nil)
    }
}
