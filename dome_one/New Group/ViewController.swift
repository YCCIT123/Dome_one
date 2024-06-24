//
//  ViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/20.
//


import UIKit
 
class ViewController: UIViewController {
    
    //最开始加载视图的一个方法
    override func loadView() {
        super.loadView()
        print("1")
    }
    
    //视图已经加载完成   这个也是我们常用的生命周期的方法，我们可以在这里面做创建视图，网络请求等操作
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print("2")
        // Do any additional setup after loading the view.
    }
    
    //将要布局子视图调用
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("3")
    }
    
    //视图将要出现调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("4")
    }
    
    //视图已经出现
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5")
    }
    
    //视图将要消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("6")
    }
    
    //视图已经消失
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("7")
    }
}
