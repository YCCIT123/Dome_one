//
//  OrderCell.swift
//  dome_one
//
//  Created by ehimac on 2024/6/18.
//

import UIKit
import SnapKit

class OrderCell: UITableViewCell{
    var orderModel: OrderModel?

//    var orderModel: OrderModel? {
//        didSet {
//            configureUI()
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIViews()
        setupUIConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let storeNameLabel = UILabel()
    let orderStateLabel = UILabel()
    let orderTitleLabel = UILabel()
    let orderMessagesLabel = UILabel()
    let orderImage = UIImageView()
    let leftMoreButton = UIButton(type: .system)
    let rightEvaluateButton = UIButton(type: .system)
    let evaluateTextField = UITextField()
    
    private func setupUIViews() {
        
        contentView.addSubview(storeNameLabel)
        contentView.addSubview(orderStateLabel)
        contentView.addSubview(orderTitleLabel)
        contentView.addSubview(orderMessagesLabel)
        contentView.addSubview(orderImage)
        contentView.addSubview(leftMoreButton)
        contentView.addSubview(rightEvaluateButton)
        contentView.addSubview(evaluateTextField)
        
        orderImage.layer.masksToBounds = true
        orderImage.layer.cornerRadius = 5
        
        orderMessagesLabel.numberOfLines = 0
        orderMessagesLabel.font = UIFont.systemFont(ofSize: 12)
        orderMessagesLabel.textColor = .gray
        
        orderStateLabel.font = UIFont.systemFont(ofSize: 14)
        orderStateLabel.textColor = .red
        
        
        leftMoreButton.setTitle("更多", for: .normal)
        leftMoreButton.setTitleColor(.gray, for: .normal)
        
        leftMoreButton.addTarget(self, action: #selector(PTM(sender:)), for: .touchUpInside)
        
        rightEvaluateButton.setTitle("评价", for: .normal)
        rightEvaluateButton.backgroundColor = .orange
        rightEvaluateButton.layer.masksToBounds = true
        rightEvaluateButton.layer.cornerRadius = 15
        rightEvaluateButton.tintColor = .white
        rightEvaluateButton.addTarget(self, action: #selector(evaluateShowBool), for: .touchUpInside)
        
        evaluateTextField.placeholder = "输入评价"
        evaluateTextField.isHidden = true
        evaluateTextField.font = UIFont.systemFont(ofSize: 12)
        evaluateTextField.borderStyle = .roundedRect
        
    }
    
    private func setupUIConstrains() {
        
//        storeNameLabel.snp.makeConstraints { make in
//            make.top.equalTo(20)
//            make.left.equalToSuperview().offset(30)
//        }
        
        orderStateLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.right.equalToSuperview().offset(-30)
        }
        
        orderImage.snp.makeConstraints { make in
            make.top.equalTo(storeNameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        orderTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(orderImage.snp.top).offset(5)
            make.left.equalTo(orderImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-30)
        }
        
        orderMessagesLabel.snp.makeConstraints { make in
            make.top.equalTo(orderTitleLabel.snp.bottom).offset(10)
            make.left.equalTo(orderImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-30)
        }
        
        leftMoreButton.snp.makeConstraints { make in
            make.top.equalTo(orderImage.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-30)
        }
        
        rightEvaluateButton.snp.makeConstraints { make in
            make.bottom.equalTo(leftMoreButton.snp.bottom)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        evaluateTextField.snp.makeConstraints { make in
            make.bottom.equalTo(leftMoreButton.snp.bottom)
            make.left.equalTo(leftMoreButton.snp.right).offset(5)
            make.right.equalTo(rightEvaluateButton.snp.left).offset(-5)
            make.height.equalTo(30)
        }
    }
    
    
    //cell赋值方法
    func configureUI(orderModel:OrderModel?) {
        self.orderModel = orderModel
        
        guard let orderModel = orderModel else { return }
        
        let maxWidth = self.contentView.frame.size.width - 30 - 150;
        let storeNameLabelW = StringTool.widthForText(orderModel.storeNameLabel , font: storeNameLabel.font, maxWidth: maxWidth, maxHeight: 10000);
        let storeNameLabelH =  StringTool.heightForText(orderModel.storeNameLabel , font: storeNameLabel.font, maxWidth: maxWidth, maxHeight: 10000);
        storeNameLabel.frame = .init(x: 30, y: 20, width: storeNameLabelW, height: storeNameLabelH);
        
        
        storeNameLabel.text = orderModel.storeNameLabel
        orderStateLabel.text = orderModel.orderStateLabel
        orderTitleLabel.text = orderModel.orderTitleLabel
        orderMessagesLabel.text = orderModel.orderMessagesLabel
        orderImage.image = orderModel.orderImage
        

    }
    
    @objc func PTM(sender:UIButton){
        print("点击成功")
        if orderStateLabel.text == "交易成功" {
            orderModel?.orderStateLabel = "交易失败"
        } else {
            orderModel?.orderStateLabel = "交易成功"
        }
        orderStateLabel.text = orderModel?.orderStateLabel
    }
    
    @objc func evaluateShowBool (){
        evaluateTextField.isHidden = !evaluateTextField.isHidden
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
