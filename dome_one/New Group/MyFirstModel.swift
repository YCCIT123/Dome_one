//
//  MyFirstModel.swift
//  dome_one
//
//  Created by liangbing on 2024/6/17.
//

import UIKit

class MyFirstModel: NSObject {

    var title:String = ""
    
    var img:UIImage?
    
    var switchData:Bool = true
    
    
    init(title: String, img: UIImage?, switchData: Bool) {
        self.title = title
        self.img = img
        self.switchData = switchData
    }
    
}
