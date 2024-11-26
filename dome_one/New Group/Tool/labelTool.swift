//
//  labelTool.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/11/13.
//

import UIKit

class labelTool: NSObject {
    
    // 静态方法只能调用静态类与静态属性
    @objc static func themeLabel (title: String) -> UILabel {
        return creat(text: title)
    }
    
    @objc static func creat (
        frame:CGRect = .zero,
        text: String? = nil,
        textColor: UIColor? = nil,
        font: UIFont? = nil,
        numberLines: Int = 0,
        backColor: UIColor? = .clear,
        textAlignment: NSTextAlignment = .left,
        cornerRadius: CGFloat = 0,
        lineBreakModel: NSLineBreakMode = .byCharWrapping,
        borderWidth:CGFloat = 0,
        borderC olor:UIColor = .clear) -> UILabel {
            let label = UILabel.init(frame: frame)
            label.text = text
            label.textColor = textColor
            label.font = font
            label.numberOfLines = numberLines
            label.backgroundColor = backColor
            label.textAlignment = textAlignment
            label.layer.cornerRadius = cornerRadius
            label.clipsToBounds = true
            label.lineBreakMode = lineBreakModel
            label.layer.borderWidth = borderWidth;
            return label
        }
}
