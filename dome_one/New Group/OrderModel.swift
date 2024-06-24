//
//  OrderModel.swift
//  dome_one
//
//  Created by ehimac on 2024/6/18.
//

import UIKit

class OrderModel: NSObject {
    var storeNameLabel:String = ""
    var orderStateLabel:String = ""
    var orderTitleLabel:String = ""
    var orderMessagesLabel:String = ""
    var orderImage: UIImage?
    
    
    
    init(storeNameLabel: String, orderStateLabel: String, orderTitleLabel: String, orderMessagesLabel: String, orderImage: UIImage? = nil) {
        self.storeNameLabel = storeNameLabel
        self.orderStateLabel = orderStateLabel
        self.orderTitleLabel = orderTitleLabel
        self.orderMessagesLabel = orderMessagesLabel
        self.orderImage = orderImage
    }
}
