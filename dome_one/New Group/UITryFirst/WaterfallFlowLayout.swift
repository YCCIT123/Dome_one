//
//  WaterfallFlowLayout.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/12/17.
//
import UIKit
import SnapKit

// 自定义瀑布流布局
//class WaterfallFlowLayout: UICollectionViewLayout {
//    
//    // MARK: - 配置项
//    var numberOfColumns: Int = 2         // 列数
//    var cellPadding: CGFloat = 6         // 单元格内边距
//    
//    // MARK: - 布局缓存与属性
//    private var cache: [UICollectionViewLayoutAttributes] = []
//    // collectionView 高度
//    private var contentHeight: CGFloat = 0
//    // collectionView 宽度
//    private var contentWidth: CGFloat {
//        guard let collectionView = collectionView else { return 0 }
//        return collectionView.bounds.width
//    }
//    
//    // MARK: - 内容大小
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: contentWidth, height: contentHeight)
//    }
//    
//    // MARK: - 布局准备
//    override func prepare() {
//        guard let collectionView = collectionView, cache.isEmpty else { return }
//        
//        // 每列的Y轴高度
//        // 他其实就是把这个瀑布流变成两个存方cell的大数组
//        // 每次将新加入的拼接到最短的那个数组上边
//        var columnHeights = Array(repeating: CGFloat(0), count: numberOfColumns)
//        
//        let columnWidth = (contentWidth - CGFloat(numberOfColumns + 1) * cellPadding) / CGFloat(numberOfColumns)
//        
//        // 遍历所有items
//        for item in 0..<collectionView.numberOfItems(inSection: 0) {
//            let indexPath = IndexPath(item: item, section: 0)
//            
//            // 随机高度（假设为假数据）
//            // arc4random_uniform(150) 0 - 149 之间的随机数
//            let itemHeight = CGFloat(arc4random_uniform(150) + 100)
//            // 这个你可以更加清楚的看到他的运行机制
////            let itemHeight = CGFloat(arc4random_uniform(300))
//            
//            // 找到最短的列
//            // columnHeights.min()这段代码是用来找出columnHeights的最小值
//            // columnHeights.firstIndex是用来找到 最小值在数组中的位置
//            let shortestColumnIndex = columnHeights.firstIndex(of: columnHeights.min()!)!
//            let xOffset = cellPadding + CGFloat(shortestColumnIndex) * (columnWidth + cellPadding)
//            let yOffset = columnHeights[shortestColumnIndex] + cellPadding
//            
//            // 计算frame
//            let frame = CGRect(x: xOffset, y: yOffset, width: columnWidth, height: itemHeight)
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//            attributes.frame = frame
//            cache.append(attributes)
//            
//            // 更新列高度
//            columnHeights[shortestColumnIndex] = yOffset + itemHeight
//        }
//        
//        // 更新内容高度
//        contentHeight = columnHeights.max() ?? 0
//    }
//    
//    // MARK: - 可见布局
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return cache.filter { $0.frame.intersects(rect) }
//    }
//    
//    // MARK: - 单个item布局
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return cache.first { $0.indexPath == indexPath }
//    }
//}

//// MARK: - 测试视图控制器
//class WaterfallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    var collectionView: UICollectionView!
//    let items = (0..<50).map { "Item \($0)" }  // 数据源
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 设置布局
//        let layout = WaterfallFlowLayout()
//        layout.numberOfColumns = 2
//        
//        // 初始化 UICollectionView
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(WaterfallCell.self, forCellWithReuseIdentifier: "WaterfallCell")
//        collectionView.showsVerticalScrollIndicator = false
//        view.addSubview(collectionView)
//    }
//    
//    // MARK: - 数据源方法
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WaterfallCell", for: indexPath) as! WaterfallCell
//        cell.configure(text: items[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath)
//        print(indexPath.row)
//        print(indexPath.section)
//    }
//}
//
//// MARK: - 自定义 Cell
//class WaterfallCell: UICollectionViewCell {
//    private let label = UILabel()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .lightGray
//        layer.cornerRadius = 8
//        
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(label)
//        
//        label.snp.makeConstraints { make in
//            make.centerX.equalTo(contentView)
//            make.centerY.equalTo(contentView)
//            make.width.equalTo(contentView).multipliedBy(0.8)
//            make.height.equalTo(20)
//        }
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(text: String) {
//        label.text = text
//    }
//}
import UIKit

class WaterfallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    let cellLabels = ["Short", "A bit longer", "Even lasdasdasdaskjdhakjshdkjashhdk asjdh kajsdhakjsh kajs hdkaonger than that", "Short", "Longer", "Very very long label", "Short", "Medium length", "Quite a long label", "Short", "Another long label", "Short", "Tiny", "A very very very long label", "Short", "Longer", "Medium length", "Short", "Another long label", "Short"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = CenterAlignedCollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        self.view.addSubview(collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellLabels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LabelCollectionViewCell
        cell.label.text = cellLabels[indexPath.item]
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = cellLabels[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 20, height: 40) // Add padding
    }
}

class LabelCollectionViewCell: UICollectionViewCell {
    let label: UILabel

    override init(frame: CGRect) {
        label = UILabel()
        label.textAlignment = .center
        super.init(frame: frame)
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CenterAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        var newAttributes: [UICollectionViewLayoutAttributes] = []
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        var rowAttributes: [UICollectionViewLayoutAttributes] = []

        for attribute in attributes {
            if attribute.frame.origin.y >= maxY {
                alignRowAttributes(rowAttributes)
                rowAttributes.removeAll()
                leftMargin = sectionInset.left
            }
            
            attribute.frame.origin.x = leftMargin
            leftMargin += attribute.frame.width + minimumInteritemSpacing
            maxY = max(attribute.frame.maxY, maxY)
            rowAttributes.append(attribute)
        }
        alignRowAttributes(rowAttributes)
        newAttributes.append(contentsOf: attributes)
        return newAttributes
    }
    
    private func alignRowAttributes(_ attributes: [UICollectionViewLayoutAttributes]) {
        let totalWidth = attributes.reduce(0) { $0 + $1.frame.width } + CGFloat(attributes.count - 1) * minimumInteritemSpacing
        let padding = (collectionView!.frame.width - totalWidth) / 2
        var offset = padding
        
        for attribute in attributes {
            attribute.frame.origin.x = offset
            offset += attribute.frame.width + minimumInteritemSpacing
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes
    }
}
