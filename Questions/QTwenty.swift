//
//  QTwenty.swift
//  Questions
//
//  Created by zhaoyang on 2020/9/4.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true

 */


class QTwenty: NSObject {

    class func isValid(_ s: String) -> Bool {
        if s.count < 2 {
            return false
        }
        var array = [Character]()
        for i in s {
            if i == "(" || i == "{" || i == "[" {
                array.append(i)
            } else {
                let c = array.last
                if let lastC = c {
                    if (i == ")" && lastC == "(") ||
                        (i == "}" && lastC == "{") ||
                        (i == "]" && lastC == "[") {
                        array.removeLast()
                    } else {
                        array.append(i)
                    }
                } else {
                    array.append(i)
                }
            }
        }
        if array.count == 0 {
            return true
        }
        return false
    }
}


/*
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。



 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。

 示例:

 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6

 */
