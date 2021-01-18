//
//  QSix.swift
//  Questions
//
//  Created by zhaoyang on 2020/7/14.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa

/*
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

 请你实现这个将字符串进行指定行数变换的函数：

 string convert(string s, int numRows);
 示例 1:

 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 示例 2:

 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:
4
 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G
 
 5
 L              I
 E          E   S           G
 E      D       H       N
 T  O           I   I
 C              R
 
 6
 L                  H
 E              S   I
 E          I       R
 T      E           I
 C  D               N
 O                  G
 
 7
 L                      R
 E                  I   I
 E              H       N
 T          S           G
 C      I
 O  E
 D
 
 
 0 K(2*numRows-2)
 1 k(2*numRows-2)+numRows-1
 i k(2*numRows-2)+i (k+1)(2*numRows-2)-i

 */
class QSix {

    class func convert(_ s: String, _ numRows: Int) -> String {
        if s.count < 2 || numRows < 2 {
            return s
        }
        let array = s.map{$0}
        var sign = 1
        var tier = -1
        var result = Array(repeating: "", count: numRows)
        for i in 0..<array.count {
            if tier == numRows-1 || (i/numRows != 0 && tier == 0) {
                sign = -sign
            }
            if sign == 1 {
                tier += 1
            } else {
                tier -= 1
            }
           result[tier] += String(array[i])
        }
        var resultStr = ""
        for s in result {
            resultStr += s
        }
        return resultStr
    }
    
    
    
    
    
}
