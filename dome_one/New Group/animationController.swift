//
//  animationController.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/10/30.
//

import UIKit

class animationController: UIViewController {
    
    private lazy var oneBtn = {
        let btn = UIButton()
        btn.setTitle("开始", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view .addSubview(oneBtn);
        
        self.oneBtn.frame = CGRect(x: 50, y: 100, width: 300, height: 60)
        
    }
   
    @objc func didAction() {
        
    }
    
}
