//
//  StringTool.swift
//  dome_one
//
//  Created by ehimac on 2024/6/19.
//

import UIKit

class StringTool: NSObject {

    
   static func heightForText(_ text: String, font: UIFont, maxWidth: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let constraintSize = CGSize(width: maxWidth, height: maxHeight)
        let boundingBox = text.boundingRect(with: constraintSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    static func widthForText(_ text: String, font: UIFont, maxWidth: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let constraintSize = CGSize(width: maxWidth, height: maxHeight)
        let boundingBox = text.boundingRect(with: constraintSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.width
    }
}
