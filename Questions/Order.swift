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
    
    
    // 归并排序
    class func mergeMethod(_ array: [Int]) -> [Int] {
        let sort = mergeSort(array)
        return sort
    }
   
    class func mergeSort(_ array: [Int]) -> [Int] {
        if array.count < 2 { return array }
        let mid = array.count/2
        let leftArray = mergeSort(Array(array[0..<mid]))
        let rightArray = mergeSort(Array(array[mid..<array.count]))
        return Merge(leftArray, rightArray)
    }
    
    // leftArray rightArray 都是已经排好序的数组
    class func Merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
        var i = 0
        var j = 0
        var sort = [Int]()
        while i < leftArray.count && j < rightArray.count {
            if leftArray[i] < rightArray[j] {
                sort.append(leftArray[i])
                i += 1
            } else {
                sort.append(rightArray[j])
                j += 1
            }
        }
        
        while i < leftArray.count {
            sort.append(leftArray[i])
            i += 1
        }
        while j < rightArray.count {
            sort.append(rightArray[j])
            j += 1
        }
        
        return sort
    }
    
    
    class func quick(_ array: [Int]) -> [Int] {
        var sort = array
        quickSort(&sort, 0, array.count-1)
        return sort
    }
    
    class func quickSort(_ array: inout [Int], _ low: Int, _ high: Int) {
        if low < high {
            let pivot = quickSortPivot(&array, low, high)
            quickSort(&array, low, pivot-1)
            quickSort(&array, pivot+1, high)
        }
    }
    
   
    
    
    class func QuickSort(array: [Int]) -> [Int] {
        var sortArray = array
//        print(sortArray)
        QSort(array: &sortArray, low: 0, high: array.count-1)
//        print(sortArray)
        

        
        return sortArray
    }
    
    
    
    // 采用递归的方式实现
    private class func QSort(array: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivot = Partition(array: &array, low: low, high: high);
            QSort(array: &array, low: low, high: pivot-1)
            QSort(array: &array, low: pivot+1, high: high)
        }
    }
    
    
    private class func Partition(array: inout [Int], low: Int, high: Int) -> Int {
        let pivotkey = array[low]
        var highIndex = high
        var lowIndex = low
        while lowIndex < highIndex {
            while lowIndex < highIndex && array[highIndex] >= pivotkey {
                highIndex-=1
            }
//            swap(array: &array, low: lowIndex, high: highIndex)
            array[lowIndex] = array[highIndex]

            while lowIndex < highIndex && array[lowIndex] <= pivotkey {
                lowIndex+=1
            }
//            swap(array: &array, low: lowIndex, high: highIndex)
            array[highIndex] = array[lowIndex]
        }
//        lowIndex == highIndex
        array[lowIndex] = pivotkey
        return lowIndex
    }
    
    private class func swap(array: inout [Int], low: Int, high: Int) {
        let temp = array[low]
        array[low] = array[high]
        array[high] = temp
    }

    
    class func quickSortPivot(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
        let pivot = array[low]
        var lowIndex = low
        var highIndex = high
        while lowIndex < highIndex {
            while lowIndex < highIndex && array[highIndex] >= pivot {
                highIndex -= 1
            }
            array[lowIndex] = array[highIndex]

            while lowIndex < highIndex && array[lowIndex] <= pivot {
                lowIndex += 1
            }
            array[highIndex] = array[lowIndex]
        }
        array[lowIndex] = pivot
        return lowIndex
    }
}
