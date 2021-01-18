//
//  Q844.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/19.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*
 给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。

 注意：如果对空文本输入退格字符，文本继续为空。

  

 示例 1：

 输入：S = "ab#c", T = "ad#c"
 输出：true
 解释：S 和 T 都会变成 “ac”。
 示例 2：

 输入：S = "ab##", T = "c#d#"
 输出：true
 解释：S 和 T 都会变成 “”。
 示例 3：

 输入：S = "a##c", T = "#a#c"
 输出：true
 解释：S 和 T 都会变成 “c”。
 示例 4：

 输入：S = "a#c", T = "b"
 输出：false
 解释：S 会变成 “c”，但 T 仍然是 “b”。
  

 提示：

 1 <= S.length <= 200
 1 <= T.length <= 200
 S 和 T 只含有小写字母以及字符 '#'。
  

 进阶：

 你可以用 O(N) 的时间复杂度和 O(1) 的空间复杂度解决该问题吗？


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/backspace-string-compare
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Q844: NSObject {
    
    class func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return getResultString(S) == getResultString(T)
    }
    
    class func getResultString(_ str: String) -> String {
        var string = ""
        for c in str {
            if c == "#" {
                _ = string.popLast()
            } else {
                string.append(c)
            }
        }
        return string
    }
    
    // O(N) 的时间复杂度和 O(1) 的空间复杂度解决该问题
    // 采用双指针
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var sIndex = S.count - 1
        var tIndex = T.count - 1
        while sIndex >= 0 && tIndex >= 0 {
            sIndex = indexCalc(S, sIndex)
            tIndex = indexCalc(T, tIndex)
            guard sIndex >= 0 && tIndex >= 0 else {
                return sIndex == -1 && tIndex == -1
            }
            if S[S.index(S.startIndex, offsetBy: sIndex)] !=
                T[T.index(T.startIndex, offsetBy: tIndex)] {
                return false
            }
            sIndex -= 1
            tIndex -= 1
        }
        sIndex = indexCalc(S, sIndex)
        tIndex = indexCalc(T, tIndex)//确保值稳定
        return sIndex == -1 && tIndex == -1
    }
    
    
    func indexCalc(_ string: String, _ i: Int) -> Int {
        var index = i
        while index >= 0 {
            if string[string.index(string.startIndex, offsetBy: index)] == "#" {
                index = indexCalc(string, index - 1) - 1
            } else {
                break
            }
        }
        return index > -1 ? index : -1//处理溢出
    }

 
}
