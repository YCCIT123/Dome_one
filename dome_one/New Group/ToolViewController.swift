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

        self.title = "富文本的使用"
        
        // 创建一个 UILabel
        var label = UILabel()
        
        label.numberOfLines = 0 // 设置为多行，以便能够显示所有文本内容
        
        let  value  = "我来学习swfit的富文本NSMutableAttributedString!" // 设置文本内容
        
        
        // MARK: - 阴影部分
        let shadow = NSShadow();
        shadow.shadowColor = UIColor.red;
        shadow.shadowBlurRadius = 5;
        
        // MARK: - 样式部分
        let paragraphStyle = NSMutableParagraphStyle();
        paragraphStyle.alignment = .center;
        paragraphStyle.firstLineHeadIndent = 5;
        paragraphStyle.lineSpacing = 20;
        
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 30),
//            .foregroundColor: UIColor.green,
//            .shadow: shadow,
//            .paragraphStyle: paragraphStyle,
//        ]
//        label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attributes);
        
        let attributedStr = NSMutableAttributedString(string: value);
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 25),
            .foregroundColor: UIColor.green,
//            .shadow: shadow,
//            .paragraphStyle: paragraphStyle,
//            .kern: 10,
//            .backgroundColor: UIColor.red,
//            .link: "https://www.chat8.co/#/home",
        ]
        attributedStr.addAttributes(attributes, range: .init(location: 4, length: 5));
        attributedStr.addAttributes(attributes, range: .init(location: 13, length: 25));
        
        attributedStr.addAttribute(.kern, value: 10, range: .init(location: 0, length: value.count))
        
        label.attributedText = attributedStr;
        
        
        
        
        
        // 添加 label 到视图中
        view.addSubview(label)
        
        label.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 100)
        label.center = view.center
        
        
    }
    
    
}
