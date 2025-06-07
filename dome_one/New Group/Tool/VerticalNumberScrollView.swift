//
//  VerticalNumberScrollView.swift
//  dome_one
//
//  Created by 杨程程 on 2025/6/7.
//

import UIKit

/**
 用于数字滚动展示的控件，内部复用VerticalScrollTextView。
 可实现从任意初始值A滚动到目标值B，支持整数和小数，滚动效果为每一位数字整体变化。
*/
class VerticalNumberScrollView: UIView, VerticalScrollTextViewDelegate {
    /** 滚动方向枚举 */
    enum ScrollDirection {
        case up   /** 向上滚动（默认） */
        case down /** 向下滚动 */
    }
    
    /** 内部用于滚动的控件 */
    private let scrollTextView = VerticalScrollTextView()
    /** 目标索引，滚动到此索引时自动停止 */
    private var targetIndex: Int = 0
    /** 滚动方向，默认向上 */
    var scrollDirection: ScrollDirection = .up
    
    /** 字体 */
    var textFont: UIFont {
        get { scrollTextView.textFont }
        set { scrollTextView.textFont = newValue }
    }
    /** 字体颜色 */
    var textColor: UIColor {
        get { scrollTextView.textColor }
        set { scrollTextView.textColor = newValue }
    }
    /** 对齐方式 */
    var textAlignment: NSTextAlignment {
        get { scrollTextView.textAlignment }
        set { scrollTextView.textAlignment = newValue }
    }
    /** 单次滚动动画时长（秒），数值越小滚动越快 */
    var scrollAnimationTime: TimeInterval {
        get { scrollTextView.scrollAnimationTime }
        set { scrollTextView.scrollAnimationTime = newValue }
    }
    
    /** 初始化方法 */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    /**
     初始化内部滚动控件并设置代理
    */
    private func setup() {
        scrollTextView.frame = bounds
        scrollTextView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollTextView.delegate = self // 设置代理
        addSubview(scrollTextView)
    }
    
    /**
     开始滚动到目标数字
     - parameter number: 目标数字B
     - parameter format: 可选，目标数字的字符串格式（如"0012.34"），用于保证显示格式和输入一致
    */
    func startScroll(to number: Double, format: String? = nil) {
        let numberStr: String
        if let format = format {
            numberStr = format
        } else {
            numberStr = formatNumber(number)
        }
        let chars = Array(numberStr)
        var arr: [NSAttributedString] = []
        // 生成两轮0-9的内容，每一项格式与目标数字一致
        for _ in 0..<2 {
            for i in 0...9 {
                var s = ""
                for c in chars {
                    if c == "." {
                        s.append(".")
                    } else {
                        s.append("\(i)")
                    }
                }
                arr.append(NSAttributedString(string: s))
            }
        }
        // 最后一项为目标数字
        arr.append(NSAttributedString(string: numberStr))
        targetIndex = arr.count - 1 // 目标索引始终为最后一项
        scrollTextView.textDataArr = arr
        // 根据滚动方向启动动画
        switch scrollDirection {
        case .up:
            scrollTextView.startContinuousScrollBottomToTop()
        case .down:
            scrollTextView.startContinuousScrollTopToBottom()
        }
    }
    
    /**
     设置初始静态展示值（如A），不滚动，仅显示
     - parameter value: 初始值A
     - parameter format: 可选，初始值的字符串格式
    */
    func setInitialValue(_ value: Double, format: String? = nil) {
        let valueStr: String
        if let format = format {
            valueStr = format
        } else {
            valueStr = formatNumber(value)
        }
        scrollTextView.textDataArr = [NSAttributedString(string: valueStr)]
        scrollTextView.stopToEmpty()
        scrollTextView.showFinalState()
    }
    
    /**
     格式化数字为与目标位数一致的字符串
     - parameter number: 需要格式化的数字
     - returns: 格式化后的字符串
    */
    private func formatNumber(_ number: Double) -> String {
        if floor(number) == number {
            // 是整数
            return String(format: "%.0f", number)
        } else {
            // 是小数，保留原有小数位数
            let str = String(number)
            if let dotIdx = str.firstIndex(of: ".") {
                let decimals = str.distance(from: dotIdx, to: str.endIndex) - 1
                return String(format: "%0*.\(decimals)f", str.count, number)
            } else {
                return String(format: "%0*.0f", str.count, number)
            }
        }
    }
    
    // MARK: - VerticalScrollTextViewDelegate
    /**
     滚动代理回调，滚动到目标索引时自动停止并强制显示目标内容
    */
    func verticalScrollText(_ scrollText: VerticalScrollTextView, currentTextIndex index: Int) {
        if index == targetIndex {
            scrollTextView.stop()
            scrollTextView.showFinalState()
        }
    }
}