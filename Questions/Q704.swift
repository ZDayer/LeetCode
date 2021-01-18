//
//  Q704.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/23.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa

class Q704: NSObject {

    /*
     给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。


     示例 1:

     输入: nums = [-1,0,3,5,9,12], target = 9
     输出: 4
     解释: 9 出现在 nums 中并且下标为 4
     示例 2:

     输入: nums = [-1,0,3,5,9,12], target = 2
     输出: -1
     解释: 2 不存在 nums 中因此返回 -1
      

     提示：

     你可以假设 nums 中的所有元素是不重复的。
     n 将在 [1, 10000]之间。
     nums 的每个元素都将在 [-9999, 9999]之间。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/binary-search
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    class func search(_ nums: [Int], _ target: Int) -> Int {
        
        var low = 0
        var high = nums.count-1
        while low <= high {
            let middle = (low + high)/2
            if nums[middle] > target {
                high = middle-1
            } else if nums[middle] < target {
                low = middle + 1
            } else {
                return middle
            }
        }
        return -1
    }
    
    
    /*
     一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。

      

     示例 1:

     输入: [0,1,3]
     输出: 2
     示例 2:

     输入: [0,1,2,3,4,5,6,7,9]
     输出: 8
      

     限制：

     1 <= 数组长度 <= 10000



     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
//    class func missingNumber(_ nums: [Int]) -> Int {
//        var low = 0
//        var high = nums.count-1
//        while low <= high {
//            let middle = (low+high)/2
////            if nums[middle] != middle {
////
////            }
//        }
//    }
//
    
    
}
