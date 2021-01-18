//
//  QFive.swift
//  Questions
//
//  Created by zhaoyang on 2020/7/13.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"
 */






















class QFive {
    class func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        // 中心扩散, 对于一个位置, 中心可能为自身, 也可能为自身和下一个字符
        // 利用swift的元组返回
        var begin = 0
        var end = 0
        let array = s.map{$0}
        for i in 0..<array.count {
            let (length1, begin1, end1) = longestLenght(array, left: i, right: i)
            let (length2, begin2, end2) = longestLenght(array, left: i, right: i+1)
            if length1 > length2 && length1 > end-begin+1 {
                begin = begin1
                end = end1
            } else if length2 > end-begin+1 {
                begin = begin2
                end = end2
            }
        }
        return String(array[begin...end])
    }
//
//
    class func longestLenght(_ chars: [Character], left: Int, right: Int) -> (Int, Int, Int) {
        var l = left
        var r = right
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        return (r-l-1, l+1, r-1)//(r - l + 1) - 2
    }
//
//
//    class func longestPalindrome(_ s: String) -> String {
//        if s.count < 2 {
//            return s
//        }
//        // 中心扩散, 对于一个位置, 中心可能为自身, 也可能为自身和下一个字符
//        var begin = 0
//        var end = 0
//        let array = s.map{$0}
//        print(type(of: array))
//        for i in 0..<array.count {
//            let length1 = longestLenght(array, left: i, right: i)
//            let length2 = longestLenght(array, left: i, right: i+1)
//            let max = length1 > length2 ? length1 : length2
//            if max > end-begin+1 {
//                begin = i-(max-1)/2
//                end = i+max/2
//            }
//        }
//        return String(array[begin...end])
//    }
//
//    class func longestLenght(_ chars: [Character], left: Int, right: Int) -> Int {
//        var l = left
//        var r = right
//        while l >= 0 && r < chars.count && chars[l] == chars[r] {
//            l -= 1
//            r += 1
//        }
//        return r-l-1//(r - l + 1) - 2
//    }

//
//

}


