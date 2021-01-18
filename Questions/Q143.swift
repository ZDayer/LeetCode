//
//  Q143.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/20.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*
 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 示例 1:

 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 示例 2:

 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reorder-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */




class Q143: NSObject {
    
    func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil {
            return
        }
        let node: ListNode? = head
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let halfNode: ListNode? = slow?.next
        slow?.next = nil
        let reverseNode: ListNode? = self.reverseReorderList(halfNode)
        self.mergeNodeList(node, reverseNode)
    }
    
    //反转链表
    func reverseReorderList(_ head: ListNode?) -> ListNode?{
        if head == nil {
            return nil
        }
        let curNode: ListNode? = head
        var nextNode: ListNode? = head
        var frontNode: ListNode? = head
        while curNode?.next != nil {
            nextNode = curNode?.next
            curNode?.next = nextNode?.next
            nextNode?.next = frontNode
            frontNode = nextNode
        }
        return frontNode
    }
    
    func mergeNodeList(_ n1: ListNode?, _ n2: ListNode?){
        var beforeNode: ListNode? = n1 //i
        var afterNode: ListNode? = n2   //j
        var resultNode: ListNode? = ListNode.init(0);
        while beforeNode != nil && afterNode != nil{
            resultNode?.next = beforeNode
            resultNode = resultNode?.next
            beforeNode = beforeNode?.next
            
            resultNode?.next = afterNode
            resultNode = resultNode?.next
            afterNode = afterNode?.next
        }
        resultNode?.next = beforeNode == nil ? afterNode : beforeNode
    }
    
    
    func reorderLists(_ head: ListNode?) {
        // 找到中点
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        // slow 为中点
        // 中点之后反转
        var pre = slow?.next
        var index = slow?.next?.next
        while index != nil {
            let temp = index
            index = index?.next
            temp?.next = pre
            pre = temp
            pre?.next = nil
        }
        slow?.next = nil

        // pre 反转后头结点
        
//        fast = head
//        while pre != nil {
//            let temp = pre?.next nil
//            pre?.next = fast?.next
//            fast?.next = pre
//            fast = pre?.next
//            pre = temp
//        }

        
    }

    
    func reorderListss(_ head: ListNode?) {
            var p = head, ln = [ListNode]()
            while let q = p {
                ln.append(q)
                p = q.next
            }
            p = ListNode(-1)
            var i = 0, j = ln.count-1
            while i <= j {
                p?.next = ln[i]
                p?.next?.next = ln[j]
                ln[j].next = nil
                p = p?.next?.next
                i+=1; j-=1
            }
        }
    
    
    /* Q 876
     给定一个带有头结点 head 的非空单链表，返回链表的中间结点。

     如果有两个中间结点，则返回第二个中间结点。

      

     示例 1：

     输入：[1,2,3,4,5]
     输出：此列表中的结点 3 (序列化形式：[3,4,5])
     返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
     注意，我们返回了一个 ListNode 类型的对象 ans，这样：
     ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
     示例 2：

     输入：[1,2,3,4,5,6]
     输出：此列表中的结点 4 (序列化形式：[4,5,6])
     由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
      

     提示：

     给定链表的结点数介于 1 和 100 之间。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/middle-of-the-linked-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var normal = head
        var fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            normal = normal?.next
        }
        return normal
    }
    
    
    
    /*
     将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

      

     示例：

     输入：1->2->4, 1->3->4
     输出：1->1->2->3->4->4


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。`
     */
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var temp1 = l1
        var temp2 = l2
        let head = ListNode()
        var index: ListNode? = head
        while temp1 != nil && temp2 != nil {
            if temp1!.val < temp2!.val {
                index?.next = temp1
                temp1 = temp1?.next
            } else {
                index?.next = temp2
                temp2 = temp2?.next
            }
            index = index?.next
        }
        
        if temp1 != nil {
            index?.next = temp1
        }
        
        if temp2 != nil {
            index?.next = temp2
        }
        
        return head.next
    }
   
    /*
     请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点。传入函数的唯一参数为 要被删除的节点 。

      

     现有一个链表 -- head = [4,5,1,9]，它可以表示为:



      

     示例 1：

     输入：head = [4,5,1,9], node = 5
     输出：[4,1,9]
     解释：给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
     示例 2：

     输入：head = [4,5,1,9], node = 1
     输出：[4,5,9]
     解释：给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
      

     提示：

     链表至少包含两个节点。
     链表中所有节点的值都是唯一的。
     给定的节点为非末尾节点并且一定是链表中的一个有效节点。
     不要从你的函数中返回任何结果。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/delete-node-in-a-linked-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func deleteNode(_ node: ListNode?) {
        // 没有head
        // 使用替代方法, 替代node.next
        
        node?.val = (node?.next!.val)!
        node?.next = node?.next?.next
        
    }
    
    
    
    
    /*
     你的朋友正在使用键盘输入他的名字 name。偶尔，在键入字符 c 时，按键可能会被长按，而字符可能被输入 1 次或多次。

     你将会检查键盘输入的字符 typed。如果它对应的可能是你的朋友的名字（其中一些字符可能被长按），那么就返回 True。

      

     示例 1：

     输入：name = "alex", typed = "aaleex"
     输出：true
     解释：'alex' 中的 'a' 和 'e' 被长按。
     示例 2：

     输入：name = "saeed", typed = "ssaaedd"
     输出：false
     解释：'e' 一定需要被键入两次，但在 typed 的输出中不是这样。
     示例 3：

     输入：name = "leelee", typed = "lleeelee"
     输出：true
     示例 4：

     输入：name = "laiden", typed = "laiden"
     输出：true
     解释：长按名字中的字符并不是必要的。
      

     提示：

     name.length <= 1000
     typed.length <= 1000
     name 和 typed 的字符都是小写字母。


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/long-pressed-name
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    class func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        let names = Array(name)
        let typeds = Array(typed)
        var i = 0
        var j = 0
        while j < typeds.count {
            if  i < name.count && names[i] == typeds[j] {
                i += 1
                j += 1
            } else if j > 0 && typeds[j] == typeds[j-1] {
                j += 1
            } else {
                return false
            }
        }
        return i == name.count
    }
    
    
    /*
     删除链表中等于给定值 val 的所有节点。

     示例:

     输入: 1->2->6->3->4->5->6, val = 6
     输出: 1->2->3->4->5
     */
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let temp: ListNode? = ListNode(0, head)
        var pre: ListNode? = temp
        var curr = temp?.next
        while curr != nil {
            if curr!.val == val {
                pre?.next = curr?.next
            } else {
                pre = curr
            }
            curr = curr?.next
        }
        return temp?.next
    }
    
    
    /*
     反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

     说明:
     1 ≤ m ≤ n ≤ 链表长度。

     示例:
           0 3 2 1 4
           0 1 2  3  4
     输入: 1->2->3->4->5->NULL, m = 2, n = 4
     输出: 1->4->3->2->5->NULL

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
            1  0
            0  1
     //    [3, 5] 1 2
     */
    
    class func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        var pre = head
        while pre != nil {
            nodes.append(pre!)
            pre = pre?.next
        }
        
        let node = ListNode()
        pre = node
        var distance = n-m
        for i in 0..<nodes.count {
            var temp: ListNode?
            if i+1 >= m && i+1 <= n {
                temp = nodes[i+distance]
                distance -= 2
            } else {
                temp = nodes[i]
            }
            pre?.next = temp
            pre = temp
        }
        
        return node.next
    }
}
