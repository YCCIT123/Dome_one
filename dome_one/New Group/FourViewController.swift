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
//import UIKit
//import SnapKit
//
//class FourViewController: UIViewController {
//    private let scrollView = UIScrollView()
//    private let labels = ["标签1", "标签2", "标签3", "标签4", "标签5"] // 示例标签数组
////    private let labels = ["标签1", "标签2"] // 示例标签数组
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        setupScrollView()
//        setupLabels()
//    }
//
//    private func setupScrollView() {
//        // 添加 ScrollView 到视图
//        view.addSubview(scrollView)
//        scrollView.showsHorizontalScrollIndicator = false // 隐藏水平滚动条
//        
//        // 使用 SnapKit 设置 ScrollView 约束
//        scrollView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.top.equalToSuperview().offset(100)
//            make.height.equalTo(50)
//        }
//    }
//
//    private func setupLabels() {
//        var totalWidth: CGFloat = 0
//        let labelWidth: CGFloat = 80
//        let labelSpacing: CGFloat = 10
//        
//        // 遍历创建标签，并手动设置 Frame
//        for (index, text) in labels.enumerated() {
//            let label = UILabel()
//            label.text = text
//            label.textAlignment = .center
//            label.backgroundColor = .lightGray
//            label.textColor = .black
//            label.font = UIFont.systemFont(ofSize: 14)
//            label.layer.cornerRadius = 5
//            label.clipsToBounds = true
//            
//            // 设置每个标签的 Frame
//            let xPosition = CGFloat(index) * (labelWidth + labelSpacing)
//            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: 40)
//            scrollView.addSubview(label)
//            
//            totalWidth = xPosition + labelWidth
//        }
//        
//        // 根据标签数量调整 ScrollView 的 contentSize 或标签居中
//        if labels.count <= 3 {
//            // 少于等于3个时居中对齐
//            let contentWidth = totalWidth
//            let scrollViewWidth = scrollView.bounds.width
//            let padding = (scrollViewWidth - contentWidth) / 2
//            
//            for (index, subview) in scrollView.subviews.enumerated() {
//                if let label = subview as? UILabel {
//                    // 调整每个标签的 x 位置，使其居中
//                    label.frame.origin.x += padding
//                }
//            }
//            scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: 50) // 不允许滚动
//        } else {
//            // 超过3个时启用滑动
//            scrollView.contentSize = CGSize(width: totalWidth, height: 50)
//        }
//    }
//}
//import UIKit
//import SnapKit
//
//class FourViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    private var containerView: UIView!
//    private var collectionView: UICollectionView!
//    private var data: [String] = [] // 数据源
//    private var containerHeightConstraint: Constraint? // 容器高度约束
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        // 初始化数据源（模拟每行文字长度不同）
//        data = [
//            "Short text",
//            "A longer piece of text that will take more space.",
//            "An even longer piece of text that will take significantly more space. Let's test how it handles wrapping over multiple lines.",
//            "Tiny",
//            "A medium length piece of text for testing."
//        ]
//        
//        // 初始化 UIView（容器视图）
//        containerView = UIView()
//        containerView.backgroundColor = .lightGray
//        view.addSubview(containerView)
//        
//        // 使用 SnapKit 布局容器视图
//        containerView.snp.makeConstraints { make in
//            make.left.right.equalToSuperview()
//            make.top.equalToSuperview().offset(100)
//            self.containerHeightConstraint = make.height.equalTo(200).constraint // 默认高度
//        }
//        
//        // 初始化 UICollectionView
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        
//        containerView.addSubview(collectionView)
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview() // 填充容器视图
//        }
//        
//        // 动态调整高度
//        DispatchQueue.main.async {
//            self.updateContainerHeight()
//        }
//    }
//    
//    // MARK: - UICollectionView DataSource
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .blue
//        
//        // 配置 Cell 内容
//        let label = UILabel()
//        label.text = data[indexPath.item]
//        label.textColor = .white
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
//        cell.contentView.addSubview(label)
//        
//        return cell
//    }
//    
//    // MARK: - 动态计算高度
//    
//    private func updateContainerHeight() {
//        // 计算 UICollectionView 的总高度
//        let totalHeight = calculateCollectionViewHeight()
//        let maxHeight = UIScreen.main.bounds.height * 3 / 4 // 最大高度为屏幕的 3/4
//        
//        // 判断是否超出最大高度
//        let finalHeight = min(totalHeight, maxHeight)
//        
//        // 更新容器高度约束
//        containerHeightConstraint?.update(offset: finalHeight)
//        
//        // 动画更新布局
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
//        
//        // 如果高度达到了最大值，允许 UICollectionView 滚动
//        collectionView.isScrollEnabled = totalHeight > maxHeight
//    }
//    
//    private func calculateCollectionViewHeight() -> CGFloat {
//        var totalHeight: CGFloat = 0
//        
//        // 遍历所有数据，动态计算每个 Cell 的高度
//        for item in data {
//            let width = collectionView.frame.width - 20 // 假设左右间距为 10
//            let height = calculateHeight(for: item, width: width)
//            totalHeight += height
//        }
//        
//        // 添加行间距
//        let lineSpacing: CGFloat = 10
//        totalHeight += CGFloat(data.count - 1) * lineSpacing
//        
//        return totalHeight
//    }
//    
//    private func calculateHeight(for text: String, width: CGFloat) -> CGFloat {
//        let font = UIFont.systemFont(ofSize: 16)
//        let boundingBox = text.boundingRect(
//            with: CGSize(width: width, height: .greatestFiniteMagnitude),
//            options: .usesLineFragmentOrigin,
//            attributes: [NSAttributedString.Key.font: font],
//            context: nil
//        )
//        return boundingBox.height + 20 // 添加一些 padding
//    }
//    
//    // MARK: - 动态 Cell 高度
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width - 20 // 假设左右间距为 10
//        let height = calculateHeight(for: data[indexPath.item], width: width)
//        return CGSize(width: width, height: height)
//    }
//}

import UIKit

class FourViewController: UIViewController {
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置 UIScrollView
        scrollView.frame = view.bounds
        scrollView.backgroundColor = .lightGray
        
        // 设置 contentSize 让其宽度大于 UIScrollView 的宽度
        scrollView.contentSize = CGSize(width: view.bounds.width * 3, height: view.bounds.height)
        
        // 添加子视图 (示例：水平排列的3个视图)
        for i in 0..<3 {
            let subView = UIView()
            subView.frame = CGRect(
                x: CGFloat(i) * view.bounds.width,
                y: 0,
                width: view.bounds.width,
                height: view.bounds.height
            )
            subView.backgroundColor = i % 2 == 0 ? .blue : .red
            scrollView.addSubview(subView)
        }
        
        // 禁用垂直回弹（可选）
        scrollView.alwaysBounceVertical = false
        
        // 将 UIScrollView 添加到视图
        view.addSubview(scrollView)
    }
}
