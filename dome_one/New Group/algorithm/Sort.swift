//
//  Sort.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/11/7.
//

import UIKit

class Sort: NSObject {
    override init() {
        super.init()
    }
}

extension Sort {
    
    // MARK: - 冒泡排序( O(n^2) )
    
    // inout 可在函数内修改传入的数据 传入时使用 &
    func bubbleSort (_ array: inout [Int]) {
        let n = array.count
        for i in 0...n {
            for j in 0...n-i-1 {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
            }
        }
    }
    
    // MARK: - 选择排序( O(n^2) )
    
    // 从未排序中找的最小 提到未排序的第一个 已排序边界向右
    func selectionSort (_ array: inout [Int]) {
        let n = array.count
        for i in 0...n {
            var minIndex = i
            for j in i + 1...n{
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            array.swapAt(i, minIndex)
        }
    }
    
    // MARK: - 插入排序( O(n^2) )
    
    // 在前边排序好的序列 选择 =< 的位置插入
    func insertionSort(_ array: inout [Int]) {
        let n = array.count
        for i in 1..<n {
            var j = i
            let key = array[i]
            while j > 0 && array[j - 1] > key {
                array[j] = array[j - 1] // 将不符合的数据 向后移一位
                j -= 1
            }
            array[j] = key
        }
    }
    
    // MARK: - 归并排序( O(nlogn) )
    
    // 递归地将数组分成两半  直到每部分只有一个元素
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }
    
    // 将两个已排序的子数组合并成一个有序数组
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                orderedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        return orderedArray
    }
    
    // MARK: - 快速排序( O(nlogn) )
    
    func quickSort(_ array: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivotIndex = partition(&array, low: low, high: high)
            quickSort(&array, low: low, high: pivotIndex - 1)
            quickSort(&array, low: pivotIndex + 1, high: high)
        }
    }
    // 目的就是为了找 high 所属的位置 并且把 > 和 < array[high] 的数据进行分开 然后在分制 如此往复 得出最终序列
    func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low
        for j in low..<high {
            if array[j] < pivot {
                array.swapAt(i, j)
                i += 1
            }
        }
        array.swapAt(i, high)
        return i
    }
    
    // MARK: - 堆排序( O(nlogn) )
    
    // https://www.cnblogs.com/chengxiao/p/6129630.html 可参考
    
    func heapSort(_ array: inout [Int]) {
        let n = array.count
        
        //  建立首个最大堆
        for i in stride(from: n / 2 - 1, through: 0, by: -1) {
            heapify(&array, n, i)
        }
        
        // 维护 使其每次交换后能够维持最大堆
        for i in stride(from: n - 1, through: 0, by: -1) {
            array.swapAt(0, i)
            heapify(&array, i, 0)
        }
    }
    
    func heapify(_ array: inout [Int], _ n: Int, _ i: Int) {
        var largest = i
        let left = 2 * i + 1
        let right = 2 * i + 2
        if left < n && array[left] > array[largest] {
            largest = left
        }
        if right < n && array[right] > array[largest] {
            largest = right
        }
        if largest != i {
            array.swapAt(i, largest)
            heapify(&array, n, largest)
        }
    }
    
    // MARK: - 希尔排序( O(n^1.5) )
    
    func shellSort(_ array: inout [Int]) {
        let n = array.count
        var gap = n / 2
        while gap > 0 {
            for i in gap..<n {
                let temp = array[i]
                var j = i
                while j >= gap && array[j - gap] > temp {
                    array[j] = array[j - gap]
                    j -= gap
                }
                array[j] = temp
            }
            gap /= 2
        }
    }

    
}
