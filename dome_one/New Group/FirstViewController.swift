//
//  FirstViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit

//protocol CellDataDelegate: AnyObject{
//    func cellData(orderData: OrderModel)
//}
 
class FirstViewController:
    UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrderCell(style: .subtitle, reuseIdentifier: "OrderCell")
        let orderModel = dataGroup[indexPath.row] // Assuming dataGroup is your array of OrderModel instances
        cell.orderModel = orderModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    let dataGroupOne = OrderModel(storeNameLabel: "one", orderStateLabel: "one",
                                  orderTitleLabel: "one", orderMessagesLabel: "one", orderImage: UIImage(named: "OrderImageOne"))
    let dataGroupTwo = OrderModel(storeNameLabel: "two", orderStateLabel: "two",
                                  orderTitleLabel: "two", orderMessagesLabel: "two", orderImage: UIImage(named: "OrderImageTwo"))
    
    lazy var dataGroup:[OrderModel] = [dataGroupOne,dataGroupTwo]
    
    var tableView: UITableView!
    
//    weak var dataDelegate: CellDataDelegate?
    
    override func viewDidLoad() {
        
        let tableView = UITableView(frame: view.bounds,style: .plain)
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
    }
    
}
