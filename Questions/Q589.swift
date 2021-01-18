//
//  Q589.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/19.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*  Q 589
 给定一个 N 叉树，返回其节点值的前序遍历。(根 -> 左 - > 右)

 例如，给定一个 3叉树 :

  



  

 返回其前序遍历: [1,3,5,6,2,4]。

  

 说明: 递归法很简单，你可以使用迭代法完成此题吗?

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Q589: NSObject {

    
}
//[1,null,3,2,4,null,5,6]
//Definition for a Node.
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

public class TreeeNode {
    public var val: Int
    public var left: TreeeNode?
    public var right: TreeeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


// 迭代 使用栈
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        var nodes = [Int]()
        var nodeList = [Node]()
        if let rootNode = root {
            nodeList.append(rootNode)
        }
        while nodeList.count > 0 {
            let node = nodeList.popLast()!
            nodes.append(node.val)
            if node.children.count > 0 {
                nodeList += node.children.reversed()
            }
        }
        return nodes
    }
    
    
    // Q 590
    func postorder(_ root: Node?) -> [Int] {
        var nodes = [Int]()
        var nodeList = [Node]()
        if let rootNode = root {
            nodeList.append(rootNode)
        }
        while nodeList.count > 0 {
            let node = nodeList.last!
            if node.children.count > 0 {
                nodeList += node.children.reversed()
                node.children = []
            } else {
                nodes.append(nodeList.popLast()!.val)
            }
        }
        return nodes
    }
    
    func levelOrderBottom(_ root: TreeeNode?) -> [[Int]] {
        
        return [[0]]
    }
    
}


/* Q 590
 给定一个 N 叉树，返回其节点值的后序遍历。 (左 -> 右 -> 根)

 例如，给定一个 3叉树 :

  



  

 返回其后序遍历: [5,6,3,2,4,1].

  

 说明: 递归法很简单，你可以使用迭代法完成此题吗?



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/* Q 107
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其自底向上的层次遍历为：

 [
   [15,7],
   [9,20],
   [3]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
