//
//  AppDelegate.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstViewController = UINavigationController(rootViewController: ViewController())
        let secondViewController = UINavigationController(rootViewController: SecondViewController())
        let thirdViewController = UINavigationController(rootViewController: ThirdViewController())
        let fourViewController = UINavigationController(rootViewController: FourViewController())
        
        firstViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("第一", comment: ""), image: UIImage(systemName: "message"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("第二", comment: ""), image: UIImage(systemName: "person.2"), tag: 1)
        thirdViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("第三", comment: ""), image: UIImage(systemName: "safari"), tag: 2)
        fourViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("第四", comment: ""), image: UIImage(systemName: "person"), tag: 3)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController, fourViewController]
        //        tabBarController.tabBar.backgroundColor = .yellow
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = .orange
        
        // 设置全局导航栏颜色
        //        UINavigationBar.appearance().backgroundColor = .red
        //        UINavigationBar.appearance().isTranslucent = false
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
    
    
    
    
}
