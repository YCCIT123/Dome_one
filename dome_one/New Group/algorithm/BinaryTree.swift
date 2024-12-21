//
//  BinaryTree.swift
//  dome_one
//
//  Created by yangchengcheng on 2024/11/4.
//

// 二叉树

import UIKit

class NoteTree <T: Comparable> {
    /** 节点数据*/
    var value: T
    /** 左节点*/
    var left: NoteTree?
    /** 右节点*/
    var right: NoteTree?
    init(value: T) {
        self.value = value
    }
}

class binaryTree <T: Comparable> {
    /** 根节点*/
    var root: NoteTree<T>?
    /** 添加新节点*/
    func addTree (value: T) {
        root == nil ? root = NoteTree(value: value) :addTreeHelp(root,value)
    }
    // 其实就是一个递归寻找  适合自己且为空的地方
    private func addTreeHelp (_ node: NoteTree<T>?,_ value: T) {
        guard let node = node else { return }
        if value < node.value {
            node.left == nil ? node.left = NoteTree(value: value) : addTreeHelp(node.left, value)
        } else {
            node.right == nil ? node.right = NoteTree(value: value) : addTreeHelp(node.right, value)
        }
    }
    /** 中序遍历     左 -> 根 -> 右*/
    func centerForTree (_ node: NoteTree<T>?) {
        guard let node = node else { return }
        centerForTree(node.left)
        print(node.value)
        centerForTree(node.right)
    }
    /** 前序遍历     根 -> 左 -> 右*/
    func beforeForTree (_ node: NoteTree<T>?) {
        guard let node = node else { return }
        print(node.value)
        beforeForTree(node.left)
        beforeForTree(node.right)
    }
    /** 后序遍历     左 -> 右 -> 根*/
    func afterForTree (_ node: NoteTree<T>?) {
        guard let node = node else { return }
        afterForTree(node.left)
        afterForTree(node.right)
        print(node.value)
    }
    /** 层序遍历*/
    func levelForTree (_ node: NoteTree<T>?) {
        guard let node = node else { return }
        var queue: [NoteTree<T>] = [node]
        while !queue.isEmpty {
            let root = queue.removeFirst()
            print(root.value)
            if let left = root.left { queue.append(left) }
            if let right = root.right { queue.append(right) }
        }
    }
}

class BinaryTree: NSObject {
    var tree = binaryTree<Int>()
    override init() {
        super.init()
        tree.addTree(value: 5)
        tree.addTree(value: 3)
        tree.addTree(value: 4)
        tree.addTree(value: 2)
        tree.addTree(value: 4)
        tree.addTree(value: 6)
        tree.addTree(value: 18)
        tree.addTree(value: 28)
        tree.addTree(value: 1)
        tree.addTree(value: 0)
        tree.addTree(value: 11)
        tree.addTree(value: 12)
        tree.addTree(value: 9)
        tree.addTree(value: 6)
        tree.addTree(value: 7)
        tree.addTree(value: 8)
        
        print("中序")
        tree.centerForTree(tree.root)
        print("前序")
        tree.beforeForTree(tree.root)
        print("后序")
        tree.afterForTree(tree.root)
        print("层级")
        tree.levelForTree(tree.root)
    }
}


//          5
//       3     6
//     2   4       18
//  1        4   11   28
//0             9  12
//               6
//                7
//                 8
