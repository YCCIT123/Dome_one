//
//  SettingViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/13.
//

import UIKit

class SettingViewController:
    UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let sectionDataone = MyFirstModel(title: "a1", img: UIImage(named: "UserImage"), switchData: true)
    let sectionDataTwo = MyFirstModel(title: "a2", img: UIImage(named: "UserImage"), switchData: false)
    let sectionDataThree = MyFirstModel(title: "a3", img: UIImage(named: "UserImage"), switchData: true)
    
    lazy var sectionOne:[MyFirstModel] = [sectionDataone, sectionDataTwo, sectionDataThree];
    
    let data = ["a1","a2","a3","a4","a5","a6","a7","a8"]
    
    
    let messages = ["b1","b2","b3","b4","b5","b6","b7","b8"]
    let setting = ["c1","c2","c3","c4","c5","c6","c7","c8"]
    
    var tableView: UITableView!
    
    var updataText: ((String) -> Void)?

    override func viewDidLoad() {
        
        self.title = "设置"
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionOne.count
        } else if section == 1 {
            return 4
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as UITableViewCell
        if indexPath.section == 0 {
            
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            
            cell.imageView?.image = sectionOne[indexPath.row].img
//            UIImage(named: "UserImage")
            cell.detailTextLabel?.text = sectionOne[indexPath.row].title
//            "2024.06.13"
            cell.textLabel?.text = data[indexPath.row]
            
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.layer.cornerRadius = 5
            
            
            // 清除之前的 accessoryView
            cell.accessoryView = nil
            cell.accessoryType = .none // 首先清除原来的附件类型
            
            // 添加文本标签
            let switchButton = UISwitch()
            switchButton.isOn = sectionOne[indexPath.row].switchData
//            switchData[indexPath.row];
            switchButton.tag = indexPath.row;
            switchButton.addTarget(self, action: #selector(switchChange(_:)), for: .valueChanged)
            cell.accessoryView = switchButton
            
            return cell
            
        } else if indexPath.section == 1 {
            
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            
            let inputStackView = UIStackView()
            
            let tableTextField = UITextField()
            
            let getTextFieldMessage = UIButton(type: .system)
            
            cell.accessoryType = .detailButton
            
            cell.contentView.addSubview(inputStackView)
            
            inputStackView.addArrangedSubview(tableTextField)
            inputStackView.addArrangedSubview(getTextFieldMessage)
            inputStackView.axis = .horizontal
            inputStackView.spacing = 10
            inputStackView.alignment = .center
            
            tableTextField.placeholder = "请输入"
            tableTextField.borderStyle = .roundedRect
            
            getTextFieldMessage.setTitle("获取", for: .normal)
            getTextFieldMessage.backgroundColor = .blue
            getTextFieldMessage.layer.masksToBounds = true
            getTextFieldMessage.layer.cornerRadius = 5
            getTextFieldMessage.tintColor = .white
            
            cell.textLabel?.text = messages[indexPath.row]
            
            inputStackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                inputStackView.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
                inputStackView.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
                inputStackView.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.6),
                inputStackView.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.8),
                
                getTextFieldMessage.widthAnchor.constraint(equalTo: inputStackView.widthAnchor, multiplier: 0.3)
                
            ])
            
            return cell
            
        } else {
            
//            let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
//            cell.accessoryType = .disclosureIndicator
//            
//            cell.textLabel?.text = setting[indexPath.row] // 设置主要文本
////            cell.detailTextLabel?.text = "a"
//            
//            updataText = { text in
//                cell.detailTextLabel?.text = text
//            }
//            return cell
                        
            let myCell = MyFirstCell(style: .default, reuseIdentifier: "MyFirstCell")
            myCell.switchActionCallback = {[weak self] (isOn) in
                self?.sectionOne[indexPath.row].switchData = isOn;
            }
            
            return myCell;
        }
        
    }

    func tableView(_ tableView: UITableView, 
                   didSelectRowAt indexPath: IndexPath) {//点击事件
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            print("数据：\(data[indexPath.row])")
        } else if indexPath.section == 1 {
            print("数据：\(messages[indexPath.row])")
        } else {
            print("数据：\(setting[indexPath.row])")
            if let cell = tableView.cellForRow(at: indexPath) {
                if let detailText = cell.detailTextLabel?.text {
                    print("数据：\(detailText)")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String?{
        if section == 0{
            return "第一栏"
        } else if section == 1{
            return "第二栏"
        } else {
            return "第三栏"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @objc func switchChange(_ sender: UISwitch) {
        print("change switch is successful:\(sender.isOn)")
        
        let index =  sender.tag;
        sectionOne[index].switchData = sender.isOn;
        
        if sender.isOn == true {
            updataText?("true")
        } else {
            updataText?("false")
        }
    }

}



