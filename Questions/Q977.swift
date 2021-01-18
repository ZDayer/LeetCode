//
//  Q977.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/16.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa

/*
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。

  

 示例 1：

 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 示例 2：

 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
  

 提示：

 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A 已按非递减顺序排序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Q977: NSObject {

    class func sortedSquares(_ A: [Int]) -> [Int] {
        let sort = A.map{ $0 * $0 }.sorted()
        
        
//        var s = 0 // start index
//        var e = A.count-1 // end index
//        var index = A.count-1
//        var sort = Array(repeating: 0, count: A.count)
//        while index >= 0 {
//            print(index)
//            if s == e {
//                sort[index] = A[s] * A[s]
//            } else {
//                if abs(A[s]) > abs(A[e]) {
//                    sort[index] = A[s] * A[s]
//                    s += 1
//                } else {
//                    sort[index] = A[e] * A[e]
//                    e -= 1
//                }
//            }
//            index -= 1
//        }
        return sort
    }
    /*
    实现一种算法，找出单向链表中倒数第 k 个节点。返回该节点的值。

    注意：本题相对原题稍作改动

    示例：

    输入： 1->2->3->4->5 和 k = 2
    输出： 4
    说明：

    给定的 k 保证是有效的。

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/kth-node-from-end-of-list-lcci
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    */
}



/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

