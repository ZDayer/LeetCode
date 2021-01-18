//
//  QSeven.swift
//  Questions
//
//  Created by zhaoyang on 2020/7/16.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa

/*
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

示例 1:

输入: 123
输出: 321
 示例 2:

输入: -123
输出: -321
示例 3:

输入: 120
输出: 21
注意:

假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
*/
class QSeven {
    
    class func reverse(_ x: Int) -> Int {
        if x < 10 && x > -10 {
            return x
        }
        var num = x
        var result = 0
        while num != 0 {
            let pop = num%10
            // 提前计算溢出
            //    2147483647
            //    -2147483648
            if result > Int32.max/10 || (result == Int32.max/10 && pop > 7) {
                return 0
            }
            if result < Int32.min/10 || (result == Int32.min/10 && pop < -8) {
                return 0
            }
            result = result*10+pop
            num = num/10
        }
        return result
    }
    
    
    
    
//    2147483647
//    -2147483648
    
}
