//
//  Q239.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/15.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*
 给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：

 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Q239: NSObject {

//    class func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        if k == 1 {
//            return nums
//        }
//        var maxs = [Int]()
//        for i in 0...nums.count-k {
//            var max = nums[i]
//            for j in i+1..<i+k {
//                if nums[j] > max {
//                    max = nums[j]
//                }
//            }
//            maxs.append(max)
//        }
//        return maxs
//    }
//
    
    class func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 1 || nums.count < 2 {
            return nums
        }
        // 构建第一个区间
        var tags = [0] // 下标记录
        var result = [Int]()  // 结果记录
        for i in 1..<k {
            if nums[i] > nums[tags.first!] {
                tags.removeAll()
            }
            tags.append(i)
        }
        result.append(nums[tags.first!])
        
        
        for i in k..<nums.count {
            while true {
                if let first = tags.first {
                    if first < i {
                        tags.removeFirst()
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
            
            while true {
                if let last = tags.last {
                    if nums[i] > tags[last] {
                        tags.removeLast()
                    } else {
                        tags.append(i)
                    }
                } else {
                    tags.append(i)
                    break
                }
            }
            
            result.append(nums[tags.first!])

        }
        
        return result
    }
    
}
//[1,3,1,2,0,5]
//
//1 3 1  3  [3, 1]
//3 1 2  3  [3, 2]
//1 2 0  2  [
//2 0 5  5

/*
 [3, 1]
 */
