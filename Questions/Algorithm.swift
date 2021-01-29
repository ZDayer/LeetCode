//
//  Algorithm.swift
//  Questions
//
//  Created by zhaoyang on 2021/1/19.
//  Copyright © 2021 zhaoyang. All rights reserved.
//

import Cocoa

class Algorithm: NSObject {
    // 合并排序链表
    class func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        let head = ListNode()
        var pre = head
        var l1Node = l1
        var l2Node = l2
        while l1Node != nil && l2Node != nil {
            if l1Node!.val > l2Node!.val {
                pre.next = l2Node
                l2Node = l2Node?.next
            } else {
                pre.next = l1Node
                l1Node = l1Node?.next
            }
            pre = pre.next!
        }
        
        if l1Node != nil {
            pre.next = l1Node
        }
        if l2Node != nil {
            pre.next = l2Node
        }
        return head.next
    }
    
    // Q24 两两交换链表中的结点
    class func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let pre = ListNode()
        var temp = pre
        pre.next = head
        while temp.next != nil && temp.next?.next != nil {
            let node1 = temp.next
            let node2 = temp.next?.next
            temp.next = node2
            node1?.next = node2?.next
            node2?.next = node1
            temp = node1!
        }
        return pre.next
    }
    
    // Q142 环形链表, 找到环形第一个结点
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var slow = head
        var fast = head?.next?.next
        while slow != nil && fast != nil {
            if slow?.val == fast?.val {
                break
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        slow = head
        
        while slow != nil && fast != nil {
            if slow?.val == fast?.val {
                break
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
