//
//  QOne.swift
//  Questions
//
//  Created by zhaoyang on 2020/6/11.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation

class QOne {
    
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var objNums : [Int] = []
//        for (index,item) in nums.enumerated() {
//            let objNum = target-item
//            if nums.contains(objNum) {
//                if index != nums.firstIndex(of: objNum)! {
//                    objNums.append(index)
//                    objNums.append(nums.firstIndex(of: objNum)!)
//                    break
//                }
//            }
//        }
//        return objNums
        var dic = [Int : Int]()
        for (index, num) in nums.enumerated() {
            let remainder = target - num
            if dic.keys.contains(remainder) {
                if let remainderIndex = dic[remainder], remainderIndex != index {
                    return [remainderIndex, index]
                }
            }
            dic[num] = index
        }
        return []
 
    }
    
    
    
    /* Q 1290
     给你一个单链表的引用结点 head。链表中每个结点的值不是 0 就是 1。已知此链表是一个整数数字的二进制表示形式。

     请你返回该链表所表示数字的 十进制值 。

      

     示例 1：



     输入：head = [1,0,1]
     输出：5
     解释：二进制数 (101) 转化为十进制数 (5)
     示例 2：

     输入：head = [0]
     输出：0
     示例 3：

     输入：head = [1]
     输出：1
     示例 4：

     输入：head = [1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]
     输出：18880
     示例 5：

     输入：head = [0,0]
     输出：0
      

     提示：

     链表不为空。
     链表的结点总数不超过 30。
     每个结点的值不是 0 就是 1。


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/convert-binary-number-in-a-linked-list-to-integer
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        // 二进制 -> 十进制
        // 101   1*2^2+0*2^1+1*2^0
        // 1*2*2 + 0*2 + 1
        
        var total = 0
        var node = head
        while node != nil {
            total = total * 2 + node!.val
            node = node?.next
        }
        return total
    }
    
    
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let node = ListNode()
        node.next = head
        var pre: ListNode? = node
        var temp = node.next
        while temp != nil {
            if temp!.val == val {
                pre?.next = temp?.next
                break
            }
            temp = temp?.next
            pre = pre?.next
        }
        return node.next
    }
    
    
    /*
     给定两个用链表表示的整数，每个节点包含一个数位。

     这些数位是反向存放的，也就是个位排在链表首部。

     编写函数对这两个整数求和，并用链表形式返回结果。

      

     示例：

     输入：(7 -> 1 -> 6) + (5 -> 9 -> 2)，即617 + 295
     输出：2 -> 1 -> 9，即912
     进阶：思考一下，假设这些数位是正向存放的，又该如何解决呢?

     示例：

     输入：(6 -> 1 -> 7) + (2 -> 9 -> 5)，即617 + 295
     输出：9 -> 1 -> 2，即912

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/sum-lists-lcci
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        let head = ListNode()
        var node = head
        var number = 0
        var remainder = 0
        while node1 != nil && node2 != nil {
            let value = node1!.val + node2!.val + remainder
            number = value%10
            remainder = value/10
            let tempNode = ListNode(number)
            node.next = tempNode
            node = tempNode
            node1 = node1?.next
            node2 = node2?.next
        }
        while node1 != nil {
            let value = node1!.val + remainder
            number = value%10
            remainder = value/10
            let tempNode = ListNode(number)
            node.next = tempNode
            node = tempNode
            node1 = node1?.next
        }
        
        while node2 != nil {
            let value = node2!.val + remainder
            number = value%10
            remainder = value/10
            let tempNode = ListNode(number)
            node.next = tempNode
            node = tempNode
            node2 = node2?.next
        }
        
        if remainder > 0 {
            let tempNode = ListNode(remainder)
            node.next = tempNode
        }
        
        return head.next
    }
    
}

