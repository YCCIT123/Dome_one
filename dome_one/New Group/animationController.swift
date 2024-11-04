//
//  animationController.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/10/30.
//

import UIKit

class animationController: UIViewController {
    
    private lazy var Angle = 0.0
    
    private lazy var Btn = {
        let btn = UIButton()
        btn.setTitle("恢复", for: .normal)
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(didAction), for: .touchUpInside)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private lazy var oneBtn = {
        let btn = UIButton()
        btn.setTitle("动画1  消失与展示", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(didAction1), for: .touchUpInside)
        return btn
    }()
    
    private lazy var twoBtn = {
        let btn = UIButton()
        btn.setTitle("动画2  放大与缩小", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(didAction2), for: .touchUpInside)
        return btn
    }()   
    
    private lazy var threeBtn = {
        let btn = UIButton()
        btn.setTitle("动画3  旋转", for: .normal)
        btn.backgroundColor = .yellow
        btn.addTarget(self, action: #selector(didAction3), for: .touchUpInside)
        return btn
    }()
        
    private lazy var fourBtn = {
        let btn = UIButton()
        btn.setTitle("动画4  修改控件属性", for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(didAction4), for: .touchUpInside)
        return btn
    }()
        
    private lazy var fiveBtn = {
        let btn = UIButton()
        btn.setTitle("动画5  反弹与重复", for: .normal)
        btn.backgroundColor = .orange
        btn.addTarget(self, action: #selector(didAction5), for: .touchUpInside)
        return btn
    }()
        
    private lazy var sixBtn = {
        let btn = UIButton()
        btn.setTitle("动画6  动画链", for: .normal)
        btn.backgroundColor = .brown
        btn.addTarget(self, action: #selector(didAction6), for: .touchUpInside)
        return btn
    }()
        
    private lazy var sevenBtn = {
        let btn = UIButton()
        btn.setTitle("动画7  延迟动画", for: .normal)
        btn.backgroundColor = .purple
        btn.addTarget(self, action: #selector(didAction7), for: .touchUpInside)
        return btn
    }()
        
    private lazy var eightBtn = {
        let btn = UIButton()
        btn.setTitle("动画8  关键帧动画", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.addTarget(self, action: #selector(didAction8), for: .touchUpInside)
        return btn
    }()
    
    private lazy var label = {
        let lab = UILabel()
        lab.text = "我是测试"
        lab.backgroundColor = .gray
        return lab;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(oneBtn);
        self.view.addSubview(twoBtn);
        self.view.addSubview(threeBtn);
        self.view.addSubview(fourBtn);
        self.view.addSubview(fiveBtn);
        self.view.addSubview(sixBtn);
        self.view.addSubview(sevenBtn);
        self.view.addSubview(eightBtn);
        
        self.view.addSubview(label)
        self.view.addSubview(Btn);
        
        self.oneBtn.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        self.twoBtn.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        self.threeBtn.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        self.fourBtn.frame = CGRect(x: 50, y: 250, width: 300, height: 30)
        self.fiveBtn.frame = CGRect(x: 50, y: 300, width: 300, height: 30)
        self.sixBtn.frame = CGRect(x: 50, y: 350, width: 300, height: 30)
        self.sevenBtn.frame = CGRect(x: 50, y: 400, width: 300, height: 30)
        self.eightBtn.frame = CGRect(x: 50, y: 450, width: 300, height: 30)
        self.label.frame = CGRect(x: 50, y: 600, width: 300, height: 60)
        self.Btn.frame = CGRect(x: 50, y: 700, width: 300, height: 60)
        
    }
   
    @objc func didAction() {
        self.Angle = 0
        self.label.transform = CGAffineTransform(rotationAngle: self.Angle)
        self.label.frame.origin.x = 50
        self.label.frame.origin.y = 600
        self.label.backgroundColor = .gray
        self.label.alpha = 1.0
        self.label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        self.label.layer.removeAllAnimations()

    }
    
    @objc func didAction1() {
        UIView.animate(withDuration: 1.0) {
            if self.label.alpha == 0.0 {
                self.label.alpha = 1.0 // 逐渐显示
            }else {
                self.label.alpha = 0.0 // 逐渐消失
            }
        }
    }
    
    @objc func didAction2() {
        self.Angle = 0
        UIView.animate(withDuration: 1.0) {
            if self.label.transform == CGAffineTransform(scaleX: 0.5, y: 0.5) {
                self.label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            } else {
                self.label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }
        } completion: { finished in
            
        }
    }
    @objc func didAction3() {
        self.Angle += (.pi * 0.5)
        UIView.animate(withDuration: 1.0) {
            self.label.transform = CGAffineTransform(rotationAngle: self.Angle) // 旋转90度
        }
    }
    @objc func didAction4() {
        UIView.animate(withDuration: 1.0) {
            self.label.frame.origin.x += 100 // 移动
            self.label.backgroundColor = .green // 改变颜色
        }
    }
    @objc func didAction5() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.label.frame.origin.x += 100 // 移动
        }, completion: nil)

    }    
    @objc func didAction6() {
        // 可以一直嵌套
        UIView.animate(withDuration: 1.0, animations: {
            self.label.frame.origin.y += 100 // 第一个动画
        }) { finished in
            UIView.animate(withDuration: 1.0, animations: {
                self.label.frame.origin.y -= 100 // 第二个动画
            }) { finished in
                UIView.animate(withDuration: 1.0, animations: {
                    self.label.frame.origin.x += 100  // 第三个动画
                })
            }
        }
    }
    @objc func didAction7() {
        UIView.animate(withDuration: 1.0, delay: 2.0, options: [], animations: {
            self.label.alpha = 0.0 // 在2秒后显现
        }, completion: nil)
    }
    @objc func didAction8() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.label.transform = CGAffineTransform(scaleX: 2.0, y: 2.0) // 放大
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.label.transform = CGAffineTransform.identity // 恢复原状
            }
        }, completion: nil)

    }
    
}
