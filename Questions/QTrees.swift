//
//  QTrees.swift
//  Questions
//
//  Created by zhaoyang on 2021/1/18.
//  Copyright © 2021 zhaoyang. All rights reserved.
//

import Cocoa

public class Nodes {
    public var val: Int
    public var left: Nodes?
    public var right: Nodes?
    public var next: Nodes?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class QTrees: NSObject {
    // Q226 二叉树翻转
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        _ = invertTree(root?.left)
        _ = invertTree(root?.right)
        
        return root
    }
    
    // Q116 填充每个节点的下一个右侧节点指针
//    class func connect(_ root: Nodes?) -> Nodes? {
//        if root == nil { return root }
//        // 使用层序遍历
//        var pre: Nodes? = nil
//        var list = [root]
//        while !list.isEmpty {
//            for i in 0..<list.count {
//                let temp = list.first!
//                if i == 0 {
//                    pre = temp
//                } else {
//                    pre?.next = temp
//                    pre = temp
//                }
//
//                if temp!.left != nil {
//                    list.append(temp!.left)
//                }
//
//                if temp!.right != nil {
//                    list.append(temp!.right)
//                }
//                list.removeFirst()
//            }
//            pre = nil
//        }
//        return root
//    }
    
    class func connect(_ root: Nodes?) -> Nodes? {
        if root == nil { return root }
        connectTwoNode(root?.left, root?.right)
        return root
    }
    
    class
    func connectTwoNode(_ node1: Nodes?, _ node2: Nodes?) {
        if node1 == nil || node2 == nil { return }
        
        node1?.next = node2
        
        connectTwoNode(node1?.left, node1?.right)
        connectTwoNode(node2?.left, node2?.right)
        
        connectTwoNode(node1?.right, node2?.left)
    }
    
    
  
}
