//
//  QThree.swift
//  Questions
//
//  Created by zhaoyang on 2020/7/8.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation

/*
给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:

输入: "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
示例 2:

输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
示例 3:

输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
*/

class QThree {
    class func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count < 2 {
            return s.count
        }
        var max = 0 // 最大长度
        var indexMax = 0 // 当前d最大长度
        var bigIndex = 0
        let map = s.map { $0 }
        var dic : [Character:Int] = [:]
        for c in map.enumerated() {
            indexMax += 1;
            let index = dic[c.element]
            if let indexs = index {
                dic.updateValue(c.offset, forKey: c.element)
                if indexs >= bigIndex {
                    indexMax = c.offset-indexs
                    bigIndex = indexs 
                } 
            } else {
                dic.updateValue(c.offset, forKey: c.element)
            }
            if indexMax > max {
                max = indexMax
            }
        }
        return max
    }
}




