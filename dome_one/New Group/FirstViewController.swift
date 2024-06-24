//
//  FirstViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit
import SnapKit

//protocol CellDataDelegate: AnyObject{
//    func cellData(orderData: OrderModel)
//}
 
class FirstViewController:
    UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataGroup.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2.5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as? OrderCell
            if cell == nil {
                 cell = OrderCell(style: .subtitle, reuseIdentifier: "OrderCell")
            }
            let orderModel = dataGroup[indexPath.section] // Assuming dataGroup is your array of OrderModel instances
    //        cell.orderModel = orderModel
            cell?.configureUI(orderModel: orderModel)
            return cell!
        }else{
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as? OrderCell
            if cell == nil {
                 cell = OrderCell(style: .subtitle, reuseIdentifier: "OrderCell")
            }
            let orderModel = dataGroup[indexPath.section] // Assuming dataGroup is your array of OrderModel instances
    //        cell.orderModel = orderModel
            cell?.configureUI(orderModel: orderModel)
            return cell!
            
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        enum a: String{
            case b,c,d
        }
        print(a.b.rawValue)
    }
    
    let dataGroupOne = OrderModel(storeNameLabel: "商家one", orderStateLabel: "交易成功",
                                  orderTitleLabel: "我是商家one的商品我是商家one的商品",
                                  orderMessagesLabel: "我是商家one商品的简介 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                                  orderImage: UIImage(named: "OrderImageOne"))
    let dataGroupTwo = OrderModel(storeNameLabel: "商家two", orderStateLabel: "交易失败",
                                  orderTitleLabel: "我是商家two的商品",
                                  orderMessagesLabel: "我是商家two商品的简介 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                                  orderImage: UIImage(named: "OrderImageTwo"))
    let dataGroupThree = OrderModel(storeNameLabel: "商家Three", orderStateLabel: "交易成功",
                                    orderTitleLabel: "我是商家Three的商品",
                                    orderMessagesLabel: "我是商家Three商品的简介 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                                    orderImage: UIImage(named: "OrderImageThree"))
    let dataGroupFour = OrderModel(storeNameLabel: "商家Four", orderStateLabel: "交易失败",
                                   orderTitleLabel: "我是商家Four的商品",
                                   orderMessagesLabel: "我是商家Four商品的简介 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                                   orderImage: UIImage(named: "OrderImageFour"))
    let dataGroupFive = OrderModel(storeNameLabel: "商家Five", orderStateLabel: "交易成功",
                                   orderTitleLabel: "我是商家Five的商品",
                                   orderMessagesLabel: "我是商家Five商品的简介 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                                   orderImage: UIImage(named: "OrderImageFive"))
    
    lazy var dataGroup:[OrderModel] = [dataGroupOne,dataGroupTwo,dataGroupThree,dataGroupFour,dataGroupFive]
    
    var tableView: UITableView!
    
//    weak var dataDelegate: CellDataDelegate?
    
    override func viewDidLoad() {
        
        self.title = "信息"
        
        let tableView = UITableView(frame: view.bounds,style: .grouped)
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.showsVerticalScrollIndicator = false
        tableView.register(OrderCell.self, forCellReuseIdentifier: "OrderCell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)  // 顶部约束与安全区域顶部对齐
            make.left.right.equalToSuperview()  // 左右边界与父视图对齐
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)  // 底部约束与安全区域底部对齐
        }
        
    }
    
}
