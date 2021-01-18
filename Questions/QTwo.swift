//
//  QTwo.swift
//  Questions
//
//  Created by zhaoyang on 2020/6/11.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



class QTwo {
    
    
    class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var p = l1
            var q = l2
            var newList = ListNode(0)
            let header = newList
            var carry = 0
            while p != nil || q != nil {
                let sum = (p?.val ?? 0)+(q?.val ?? 0)+carry
                carry = sum/10
                let node = ListNode(sum%10)
                newList.next = node
                newList = node
                p = p?.next
                q = q?.next
            }
            if carry != 0 { // 溢出的情况
                newList.next = ListNode(carry)
            }
            return header.next;
        }
    }
      
    
    
    func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
        var index = head
        var result = head
        var count = k-1
        while count > 0 {
            index = index?.next
            if index == nil {
                return 0
            }
            count -= 1
        }
        
        while index != nil {
            index = index?.next
            result = result?.next
        }
        
        return result!.val
    }
/*
    反转一个单链表。

    示例:

    输入: 1->2->3->4->5->NULL
    输出: 5->4->3->2->1->NULL
    进阶:
    你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/reverse-linked-list
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
    
    
    /*
     请判断一个链表是否为回文链表。

     示例 1:

     输入: 1->2
     输出: false
     示例 2:

     输入: 1->2->2->1
     输出: true
     进阶：
     你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？



     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/palindrome-linked-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */


    class func isPalindrome(_ head: ListNode?) -> Bool {
        let values = reversePrint(head)
        var node = head
        for i in 0...(values.count/2) {
            if node != nil {
                if values[i] != node!.val {
                    return false
                }
            }
            node = node?.next
        }
        return true
    }
    
    
    
    /*
     输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

      

     示例 1：

     输入：head = [1,3,2]
     输出：[2,3,1]
      

     限制：

     0 <= 链表长度 <= 10000

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    class func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        } else if head?.next == nil {
            return [head!.val]
        }
        var result = reversePrint(head?.next)
        if let value = head?.val {
            result.append(value)
        }
        return result
    }
    

    /*
     给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

     你应当保留两个分区中每个节点的初始相对位置。

      

     示例:

     输入: head = 1->4->3->2->5->2, x = 3
     输出: 1->2->2->4->3->5


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/partition-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    class func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
//
        let temp = ListNode()
        let tempHead = ListNode()

        var node1: ListNode? = temp
        var node2: ListNode? = tempHead
        var node: ListNode? = head
        while node != nil {
            let tempNode = node
            node = node?.next
            if tempNode!.val < x {
                node1?.next = tempNode
                node1 = tempNode
                node1?.next = nil
            } else {
                node2?.next = tempNode
                node2 = tempNode
                node2?.next = nil
            }
        }
        node1?.next = tempHead.next
        return temp.next
    }
    
    /*
     在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。

     示例 1:

     输入: 4->2->1->3
     输出: 1->2->3->4
     示例 2:

     输入: -1->5->3->4->0
     输出: -1->0->3->4->5

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/sort-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    // O(n log n)   O(1)
    // 采用归并排序
//    func sortList(_ head: ListNode?) -> ListNode? {
//
//    }
}
