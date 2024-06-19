//
//  ToolViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/18.
//

import UIKit

class ToolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "label高度"
        
        // 创建一个 UILabel
        let label = UILabel()
        label.numberOfLines = 0 // 设置为多行，以便能够显示所有文本内容
        label.text = "asdgggjhhhhhhhhhhhhhhhhhuwudwegdwuygeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeecweeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgwccccccccccccccca®ccccccccccccccccccccscccccccaaaaaaaaaaaaaaaaaaasdgggjhhhhhhhhhhhhhhhhhuwudwegdwuygeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeecweeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgwccccccccccccccca®ccccccccccccccccccccscccccccaaaaaaasdgggjhhhhhhhhhhhhhhhhhuwudwegdwuygeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeecweeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgwccccccccccccccca®ccccccccccccccccccccscccccccaaaaaaaqweqweqeqweqfdafr4efsfaaefrgtyhjuikjuhygtfrdeswdefrgtyhujikjuhygtfrdeswasedrfgtyhujhygtfrdeswaqwsedrftgyhuygtr" // 设置文本内容
        label.font = UIFont.systemFont(ofSize: 17.0) // 设置字体
        
        // 添加 label 到视图中
        view.addSubview(label)
        
        // 计算文本的高度
        let maxHeight: CGFloat = 1000 // 设置一个较大的高度作为最大高度限制
        let textHeight = heightForText(label.text ?? "", font: label.font, maxWidth: view.bounds.width - 40, maxHeight: maxHeight)
        
        label.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: textHeight)
        label.center = view.center
        label.backgroundColor = .red
    }
    
    func heightForText(_ text: String, font: UIFont, maxWidth: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let constraintSize = CGSize(width: maxWidth, height: maxHeight)
        let boundingBox = text.boundingRect(with: constraintSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
