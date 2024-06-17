//
//  FourViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit

class FourViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let headView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "个人"
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        headView.backgroundColor = .blue
        headView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(headView)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            headView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            headView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            
        ])
        
        // 设置 scrollView 的 contentSize 为 headView 的大小
//        scrollView.contentSize = headView.bounds.size
    }
}
