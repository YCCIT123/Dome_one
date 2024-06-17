//
//  FirstViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit

class FirstViewController: 
    UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 模拟的消息数据
    let messages = [
        "Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
        ,"Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
        ,"Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
        ,"Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
        ,"Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
        ,"Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
        ,"Hello!", "How are you?", "I'm fine, thank you!",
        "What about you?","I'm good too"
    ]
    
    // 表格视图
    var tableView: UITableView!
    
    override func viewDidLoad() {
        
        //        view.backgroundColor = .brown
        
        navigationItem.title = "信息"
        
        super.viewDidLoad()
        // 设置表格视图
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //重复使用Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
