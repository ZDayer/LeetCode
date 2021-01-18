//
//  Q1002.swift
//  Questions
//
//  Created by zhaoyang on 2020/10/14.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Cocoa
/*
 
 给定仅有小写字母组成的字符串数组 A，返回列表中的每个字符串中都显示的全部字符（包括重复字符）组成的列表。例如，如果一个字符在每个字符串中出现 3 次，但不是 4 次，则需要在最终答案中包含该字符 3 次。

 你可以按任意顺序返回答案。

  

 示例 1：

 输入：["bella","label","roller"]
 输出：["e","l","l"]
 示例 2：

 输入：["cool","lock","cook"]
 输出：["c","o"]
  

 提示：

 1 <= A.length <= 100
 1 <= A[i].length <= 100
 A[i][j] 是小写字母
 
 */
class Q1002: NSObject {
    class func commonChars(_ A: [String]) -> [String] {
        if A.count == 0 {
            return [String]()
        }
        let value = Character("a").asciiValue!
        var tags = Array(repeating: 0, count: 26)
        for c in A.first! {
            tags[Int(c.asciiValue! - value)] += 1
        }

        for string in A {
            var sTags = Array(repeating: 0, count: 26)
            for c in string {
                sTags[Int(c.asciiValue! - value)] += 1
            }
            for i in 0..<26 {
                tags[i] = min(tags[i], sTags[i])
            }
        }
        
        var result = [String]()

        for i in 0..<26 {
            for _ in 0..<tags[i] {
                let s = String(UnicodeScalar(UInt8(i) + value))
                result.append(s)
            }
        }
        return result
    }
    
    
//    func commonChars(_ A: [String]) -> [String] {
//            var minfreq = Array(repeating: Int.max, count: 26)
//            for s in A {
//                var freq = Array(repeating: 0, count: 26)
//                for c in s {
//                    let asciiValue = c.asciiValue! - Character("a").asciiValue!
//                    freq[Int(asciiValue)] += 1
//                }
//                for i in 0..<26 {
//                    minfreq[i] = min(freq[i], minfreq[i])
//                }
//            }
//
//            var res = [String]()
//            for i in 0..<26 {
//                for _ in 0..<minfreq[i] {
//                    res.append(String(UnicodeScalar(UInt8(i + Int(Character("a").asciiValue!)))))
//                }
//            }
//            return res
//        }

}
