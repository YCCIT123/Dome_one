//
//  LinkedList.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/11/4.
//

import UIKit

// MARK: - 单链表

class SingleNote<T: Comparable> {
    /** 单链表数据*/
    var value: T
    /** 指向下一个*/
    var next: SingleNote?
    
    init(value: T){
        self.value = value
    }
}

class SingLinkedList<T: Comparable> {
    
    /** head是链表第一个     除了第一次添加与删除头节点    以后不会变*/
    private var head: SingleNote<T>?
    /** 链表添加节点到末尾*/
    func append(value: T){
        let newNode = SingleNote(value: value)
        // 这几步是为了找到链表的最后一个再把新的加入进去
        if let tail = head {
            var current = tail
            while let next = current.next {
                current = next
            }
            current.next = newNode
        } else {
            // 没有head 就当前为head
            head = newNode
        }
    }
    /** 链表删除指定节点*/
    func delete(value: T) {
        var current = head
        var previous: SingleNote<T>?
        while let node = current {
            if node.value == value {
                if let prev = previous {
                    prev.next = node.next
                } else {
                    head = node.next
                }
                return
            }
            previous = current
            current = node.next
        }
    }
    /** 修改节点的值*/
    func update(oldValue: T, newValue: T) {
        if let node = find(value: oldValue) {
            node.value = newValue
        }
    }
    /** 查找节点的值*/
    func find(value: T) -> SingleNote<T>? {
        var currert = head
        while let node = currert  {
            if node.value == value {
                return node
            }
            currert = node.next
        }
        return nil
    }
    /** 打印列表*/
    func printf() {
        var current = head
        while let node = current {
            print(node.value)
            current = node.next
        }
    }
}

// MARK: - 双链表

class DoubleNote<T: Comparable> {
    /** 节点数据*/
    var value: T
    /** 下一个节点*/
    var next: DoubleNote?
    /** 上一个节点*/
    var prev: DoubleNote?
    
    init(value:T) {
        self.value = value
    }
}

class DoubleLinkedList <T: Comparable> {
    /** 头结点*/
    private var head: DoubleNote<T>?
    /** 尾结点*/
    private var tail: DoubleNote<T>?
    // 添加节点到末尾
    func append(value: T) {
        let newNode = DoubleNote(value: value)
        if let tailNote = tail {
            tailNote.next = newNode
            newNode.prev = tailNote
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
    // 删除指定值的节点
    func delete(value: T) {
        var current = head
        while let node = current {
            if node.value == value {
                let next = node.next
                let prev = node.prev
                if let prevNode = prev {
                    prevNode.next = next
                } else {
                    head = next
                }
                if let nextNote = next {
                    nextNote.prev = prev
                } else {
                    tail = prev
                }
                return
            }
            current = node.next
        }
    }
    // 查找节点
    func find(value: T) -> DoubleNote<T>? {
        var current = head
        while let node = current {
            if node.value == value {
                return node
            }
            current = node.next
        }
        return nil
    }
    // 修改节点的值
    func update(oldValue: T, newValue: T) {
        if let node = find(value: oldValue) {
            node.value = newValue
        }
    }
    // 打印链表
    func printList() {
        var current = head
        while let node = current {
            print(node.value)
            current = node.next
        }
    }
}

// MARK: - 主程序

class LinkedList: NSObject {
    override init() {
        super.init()
        
        // 单链表示例使用
        let singlyLinkedList = SingLinkedList<Int>()
        singlyLinkedList.append(value: 1)
        singlyLinkedList.append(value: 2)
        singlyLinkedList.append(value: 3)
        print("Original List:")
        singlyLinkedList.printf()

        singlyLinkedList.delete(value: 2)
        print("After Deletion:")
        singlyLinkedList.printf()

        singlyLinkedList.update(oldValue: 3, newValue: 4)
        print("After Update:")
        singlyLinkedList.printf()

        if let foundNode = singlyLinkedList.find(value: 4) {
            print("Found node with value:", foundNode.value)
        } else {
            print("Node not found")
        }

        // 双链表示例使用
        let doublyLinkedList = DoubleLinkedList<Int>()
        
        doublyLinkedList.append(value: 1)
        doublyLinkedList.append(value: 2)
        doublyLinkedList.append(value: 3)
        print("Original List:")
        doublyLinkedList.printList()

        doublyLinkedList.delete(value: 2)
        print("After Deletion:")
        doublyLinkedList.printList()

        doublyLinkedList.update(oldValue: 3, newValue: 4)
        print("After Update:")
        doublyLinkedList.printList()

        if let foundNode = doublyLinkedList.find(value: 4) {
            print("Found node with value:", foundNode.value)
        } else {
            print("Node not found")
        }
    }
}
