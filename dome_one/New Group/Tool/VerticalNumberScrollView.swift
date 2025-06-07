//
//  VerticalNumberScrollView.swift
//  dome_one
//
//  Created by 杨程程 on 2025/6/7.
//

import UIKit

class VerticalNumberScrollView: UIView, VerticalScrollTextViewDelegate {
    private let scrollTextView = VerticalScrollTextView()
    private var targetIndex: Int = 0
    
    var textFont: UIFont {
        get { scrollTextView.textFont }
        set { scrollTextView.textFont = newValue }
    }
    var textColor: UIColor {
        get { scrollTextView.textColor }
        set { scrollTextView.textColor = newValue }
    }
    var textAlignment: NSTextAlignment {
        get { scrollTextView.textAlignment }
        set { scrollTextView.textAlignment = newValue }
    }
    var scrollAnimationTime: TimeInterval {
        get { scrollTextView.scrollAnimationTime }
        set { scrollTextView.scrollAnimationTime = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        scrollTextView.frame = bounds
        scrollTextView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollTextView.delegate = self // 设置代理
        addSubview(scrollTextView)
    }
    
    /// 开始滚动到目标数字
    func startScroll(to number: Double, format: String? = nil) {
        // format参数为可选，优先用format，否则用formatNumber
        let numberStr: String
        if let format = format {
            numberStr = format
        } else {
            numberStr = formatNumber(number)
        }
        let chars = Array(numberStr)
        var arr: [NSAttributedString] = []
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
        arr.append(NSAttributedString(string: numberStr))
        scrollTextView.textDataArr = arr
        targetIndex = arr.count - 1
        scrollTextView.startContinuousScrollBottomToTop()
    }
    
    /// 格式化数字为与B位数一致的字符串
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
    
    /// 设置初始静态展示值
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
    
    // MARK: - VerticalScrollTextViewDelegate
    func verticalScrollText(_ scrollText: VerticalScrollTextView, currentTextIndex index: Int) {
        if index == targetIndex {
            scrollTextView.stop()
            scrollTextView.showFinalState()
        }
    }
}