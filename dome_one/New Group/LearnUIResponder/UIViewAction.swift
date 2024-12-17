//
//  UIViewAction.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/11/26.
//

// MARK: - 这个是来自学习 事件的传递和响应机制

import UIKit

class UIViewAction: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("触摸开始")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            // 当前手指的位置
            let location = touch.location(in: self)
            // 上一个位置
            let previousLocation = touch.previousLocation(in: self)
            let changeX = location.x - previousLocation.x
            let changeY = location.y - previousLocation.y
            self.frame.origin.x += changeX
            self.frame.origin.y += changeY
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("触摸结束")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("触摸被打断取消啦")
    }
    
    // 来决定最优响应UIView 只能在UIView中使用
    // 一定要在父视图中使用 下面的调用会有问题
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        super.hitTest(point, with: event)
//        return self
//    }
    
    // 判断触摸点是否在自己身上
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        // 在这里可以添加自定义逻辑，例如扩大或缩小触摸区域
        return super.point(inside: point, with: event)
    }
    
}

class UIViewNextAction: UIView {
    
}


