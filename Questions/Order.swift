//
//  Order.swift
//  Questions
//
//  Created by zhaoyang on 2020/12/30.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation

class Order : NSObject {
    
    // 冒泡排序, 时间复杂度 n 平方, 稳定
    
    // 最简单的实现
    class func BubbleSort1(_ sort: inout [Int]) {
        for i in 0..<sort.count-1 {
            for j in i+1..<sort.count {
                if sort[i] > sort[j] {
                    let temp = sort[j]
                    sort[j] = sort[i]
                    sort[i] = temp
                }
            }
        }
    }
    
    // 优化实现
    class func BubbleSort2(_ sort: inout [Int]) {
        for i in 0..<sort.count-1 {
            for j in (i..<sort.count-1).reversed() {
                print(j, j+1)
                if sort[j] > sort[j+1] {
                    let temp = sort[j+1]
                    sort[j+1] = sort[j]
                    sort[j] = temp
                }
            }
        }
    }
    
    // 添加 flag
    class func BubbleSort3(_ sort: inout [Int]) {
        var flag = true
        for i in 0..<sort.count-1 {
            if flag {
                flag = false
                for j in (i..<sort.count-1).reversed() {
                    if sort[j] > sort[j+1] {
                        let temp = sort[j+1]
                        sort[j+1] = sort[j]
                        sort[j] = temp
                        flag = true
                    }
                }
            }
        }
    }
    
    
    // 选择排序, 找到最小的, 时间 n 平方, 稳定
    class func SelectSort(_ sort: inout [Int]) {
        for i in 0..<sort.count {
            var min = i
            for j in i+1..<sort.count {
                if sort[min] > sort[j] {
                    min = j
                }
            }
            if i != min {
                let temp = sort[i]
                sort[i] = sort[min]
                sort[min] = temp
            }
        }
    }
    
    // 插入排序, 稳定 n 平方
    class func InsertSort(_ sort: inout [Int]) {
        // 默认前面是已经排好序的
        for i in 1..<sort.count {
            if sort[i] < sort[i-1] {
                let temp = sort[i]
                var j = i-1
                
                // 数据向后移动
                while j >= 0 && sort[j] > temp {
                    sort[j+1] = sort[j]
                    j -= 1
                }
                sort[j+1] = temp
            }
        }
    }
    
    // 堆排序  时间复杂度 O(nlogn)  最好, 最坏, 平均 都是
    // 不稳定的排序
    // 不适合排序个数较少的情况
    
    // 大堆顶
    class func HeapSort(_ sort: inout [Int]) {
        // 构建大堆顶 从下向上构建, 完全二叉树 父节点为 i, 左子节点为 2*i, 右子节点为 2*i+1
        for i in (1..<sort.count/2).reversed() {
            HeapAdjust(&sort, start: i, end: sort.count)
        }
        
        for i in (1..<sort.count/2).reversed() {
            let temp = sort[0]
            sort[0] = sort[i]
            sort[i] = temp
            
            HeapAdjust(&sort, start: 1, end: i)
        }
        
    }
    
    class func HeapAdjust(_ array: inout [Int], start: Int, end: Int)  {
        
    }
    
    
   
    
}
