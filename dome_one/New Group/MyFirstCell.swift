//
//  MyFirstCell.swift
//  dome_one
//
//  Created by liangbing on 2024/6/17.
//

import UIKit

class MyFirstCell: UITableViewCell {

    var switchActionCallback:((Bool)->())?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style
                   , reuseIdentifier: reuseIdentifier)
        configUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI() {
        
        
        // 添加文本标签
        let switchButton = UISwitch()
        
        switchButton.addTarget(self, action: #selector(switchChange(_:)), for: .valueChanged)
        
        self.contentView.addSubview(switchButton);
        
        
        
    }
    
    @objc func switchChange(_ sender: UISwitch) {
        print("change switch is successful:\(sender.isOn)")
        
        self.switchActionCallback?(sender.isOn)
    }

    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
