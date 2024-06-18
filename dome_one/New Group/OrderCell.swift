//
//  OrderCell.swift
//  dome_one
//
//  Created by ehimac on 2024/6/18.
//

import UIKit

class OrderCell: UITableViewCell{

    var orderModel: OrderModel? {
        didSet {
            configureUI()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let storeNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let orderStateLabel = UILabel(frame: CGRect(x: 0, y: 30, width: 30, height: 30))
    let orderTitleLabel = UILabel(frame: CGRect(x: 0, y: 60, width: 30, height: 30))
    let orderMessagesLabel = UILabel(frame: CGRect(x: 0, y: 90, width: 30, height: 30))
    let orderImage = UIImageView(frame: CGRect(x: 0, y: 120, width: 30, height: 30))
    let leftMoreButton = UIButton(type: .system)
    let rightEvaluateButton = UIButton(type: .system)
    
    func setupUI() {
        
        contentView.addSubview(storeNameLabel)
        contentView.addSubview(orderStateLabel)
        contentView.addSubview(orderTitleLabel)
        contentView.addSubview(orderMessagesLabel)
        contentView.addSubview(orderImage)
        contentView.addSubview(leftMoreButton)
        contentView.addSubview(rightEvaluateButton)
        
    }
    
    func configureUI() {
        guard let orderModel = orderModel else { return }
        storeNameLabel.text = orderModel.storeNameLabel
        orderStateLabel.text = orderModel.orderStateLabel
        orderTitleLabel.text = orderModel.orderTitleLabel
        orderMessagesLabel.text = orderModel.orderMessagesLabel
        orderImage.image = orderModel.orderImage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
