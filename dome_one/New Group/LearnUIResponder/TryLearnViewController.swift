//
//  TryLearnViewController.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/11/26.
//

import UIKit

class TryLearnViewController: UIViewController {
    
    private lazy var touchesView = {
        let view = UIViewAction()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var touchesNextView = {
        let view = UIViewAction()
        view.backgroundColor = .blue
        return view
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    
    
    
    
}

extension TryLearnViewController {
    private func setUI (){
        self.view.addSubview(self.touchesView)
        self.view.addSubview(self.touchesNextView)
        self.layoutUI()
    }
    private func layoutUI() {
        self.touchesView.frame = .init(x: 100, y: 200, width: UIScreen.main.bounds.width - 200, height: 200)
        self.touchesNextView.frame = .init(x: 100, y: 300, width: UIScreen.main.bounds.width - 200, height: 200)
    }
}
