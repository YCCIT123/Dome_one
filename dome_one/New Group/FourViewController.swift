//
//  FourViewController.swift
//  dome_one
//
//  Created by ehimac on 2024/6/6.
//

//import UIKit
//
//class FourViewController: UIViewController {
//    
//    let scrollView = UIScrollView()
//    let headView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationItem.title = "个人"
//        
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        
//        headView.backgroundColor = .blue
//        headView.translatesAutoresizingMaskIntoConstraints = false
//        
//        scrollView.addSubview(headView)
//        view.addSubview(scrollView)
//        
//        NSLayoutConstraint.activate([
//            
//            
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            
//            
//            headView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
//            headView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            headView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            headView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            headView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            headView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
//            
//            
//        ])
//        
//        // 设置 scrollView 的 contentSize 为 headView 的大小
////        scrollView.contentSize = headView.bounds.size
//    }
//}
//
//import UIKit
//
//class FourViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 创建一个按钮
//        let button = UIButton(type: .system)
//        button.setTitle("显示选择界面", for: .normal)
//        button.addTarget(self, action: #selector(showHalfScreenView), for: .touchUpInside)
//        button.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
//        view.addSubview(button)
//    }
//    
//    @objc func showHalfScreenView() {
//        // 创建并显示占据屏幕一半高度的视图控制器
//        let halfScreenVC = HalfScreenViewController()
//        halfScreenVC.modalPresentationStyle = .overFullScreen
//        present(halfScreenVC, animated: true, completion: nil)
//    }
//}
//
//class HalfScreenViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 设置背景色和透明度
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
//        
//        // 添加一个占据屏幕一半高度的白色背景视图
//        let halfHeight = UIScreen.main.bounds.height / 2
//        let contentView = UIView(frame: CGRect(x: 0, y: view.bounds.height - halfHeight, width: view.bounds.width, height: halfHeight))
//        contentView.backgroundColor = .white
//        contentView.layer.cornerRadius = 10 // 设置圆角半径
//        view.addSubview(contentView)
//        
//        // 添加导航标题
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: contentView.bounds.width, height: 30))
//        titleLabel.text = "选择界面"
//        titleLabel.textAlignment = .center
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        contentView.addSubview(titleLabel)
//        
//        // 添加返回按钮
//        let backButton = UIButton(type: .system)
//        backButton.setTitle("返回", for: .normal)
//        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        backButton.setTitleColor(.black, for: .normal)
//        backButton.frame = CGRect(x: 20, y: 20, width: 60, height: 30)
//        backButton.addTarget(self, action: #selector(dismissHalfScreen), for: .touchUpInside)
//        contentView.addSubview(backButton)
//    }
//    
//    @objc func dismissHalfScreen() {
//        dismiss(animated: true, completion: nil)
//    }
//}

//import UIKit
//
//class FourViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//    
//    let data = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"] // 你的选项数据
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let pickerView = UIPickerView()
//        pickerView.dataSource = self
//        pickerView.delegate = self
//        
//        view.addSubview(pickerView)
//        
//        // Add constraints or frame configuration for pickerView
//        pickerView.translatesAutoresizingMaskIntoConstraints = false
//        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
//    
//    // MARK: - UIPickerViewDataSource
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 // 单列选择器
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return data.count
//    }
//    
//    // MARK: - UIPickerViewDelegate
//    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let label = UILabel()
//        label.text = data[row]
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 18.0) // 自定义字体大小
//        
//        // 设置行高，增加选项之间的间距
//        let pickerRowHeight: CGFloat = 36.0 // 自定义行高
//        let pickerViewWidth = pickerView.bounds.size.width
//        let labelWidth = pickerViewWidth * 3 / CGFloat(data.count)  // 每个选项的宽度
//        let labelHeight = pickerRowHeight // 每个选项的高度
//        let labelRect = CGRect(x: 0, y: 0, width: labelWidth, height: labelHeight)
//        label.frame = labelRect
//        
//        return label
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 40.0 // 设置整体行高
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let selectedOption = data[row]
//        print("Selected: \(selectedOption)")
//        // 可以在这里处理选中选项后的逻辑
//    }
//}
import UIKit
import CoreLocation
import MapKit

class FourViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 请求使用时定位权限
    }
    
    // 当定位权限状态发生改变时调用
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("定位权限已授权（使用期间）")
            locationManager.startUpdatingLocation() // 开始定位更新
        } else if status == .denied {
            print("用户拒绝了定位权限")
            locationManager.startUpdatingLocation()
        }
    }
    
    // 获取位置信息成功时调用
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("当前位置：\(location.coordinate.latitude), \(location.coordinate.longitude)")
        // 在此处理获取到的位置信息
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        // 设置地图显示区域
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)

        // 添加标记
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "你的位置"
        annotation.subtitle = "经度: \(latitude), 纬度: \(longitude)"
        mapView.addAnnotation(annotation)
        
        // 停止更新位置，节省电量
        locationManager.stopUpdatingLocation()

    }
    
    // 获取位置信息失败时调用
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("获取位置信息失败：\(error.localizedDescription)")
    }
     
}
