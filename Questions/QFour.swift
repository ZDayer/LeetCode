//
//  QFour.swift
//  Questions
//
//  Created by zhaoyang on 2020/6/11.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation


class QFour {
    class func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let mid = Double(nums1.count+nums2.count)/2.0
        
        let min = Int(mid)
        var max = lround(mid)
        var twoNum = false
        if min == max {
            max += 1
            // 取两个
            twoNum = true
        }
        var tempNum1 = nums1
        var tempNum2 = nums2
       
        var minNum = 0
        var maxNum = 0
        var index = 0
        while index != max {
            if tempNum1.count == 0 {
                if twoNum {
                    if index == min-1 {
                        minNum = tempNum2.first!
                    }
                    if index == max-1 {
                        maxNum = tempNum2.first!
                    }
                } else {
                    if index == max-1 {
                        minNum = tempNum2.first!
                        maxNum = minNum
                    }
                }
                tempNum2.remove(at: 0)
            } else if tempNum2.count == 0 {
                if twoNum {
                    if index == min-1 {
                        minNum = tempNum1.first!
                    }
                    if index == max-1 {
                        maxNum = tempNum1.first!
                    }
                } else {
                    if index == max-1 {
                        minNum = tempNum1.first!
                        maxNum = minNum
                    }
                }
                tempNum1.remove(at: 0)
            } else {
                if tempNum1.first! >= tempNum2.first! {
                    if twoNum {
                        if index == min-1 {
                            minNum = tempNum2.first!
                        }
                        if index == max-1 {
                            maxNum = tempNum2.first!
                        }
                    } else {
                        if index == max-1 {
                            minNum = tempNum2.first!
                            maxNum = minNum
                        }
                    }
                    tempNum2.remove(at: 0)
                } else if tempNum1.first! < tempNum2.first! {
                    if twoNum {
                        if index == min-1 {
                            minNum = tempNum1.first!
                        }
                        if index == max-1 {
                            maxNum = tempNum1.first!
                        }
                    } else {
                        if index == max-1 {
                            minNum = tempNum1.first!
                            maxNum = minNum
                        }
                    }
                    tempNum1.remove(at: 0)
                }
            }
            index += 1
        }
        return Double(minNum+maxNum)/2.0
    }
    
//    class func rewrite_findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        if nums1.count == 0 && nums2.count == 0 {
//            return 0.0
//        }
//        var min = 0
//        var max = 0
//        let count = nums1.count+nums2.count
//        if count%2 == 1 {
//            min = count/2
//            max = min
//        } else {
//            max = count/2
//            min = max-1
//        }
//        var merge = [Int]()
//        var i = 0
//        var j = 0
//        while merge.count != max+1 && i < nums1.count && j < nums2.count {
//            if nums1[i] <= nums2[j] {
//                merge.append(nums1[i])
//                i+=1
//            } else {
//                merge.append(nums2[j])
//                j+=1
//            }
//        }
//
//        while merge.count != max+1 && i < nums1.count {
//            merge.append(nums1[i])
//            i+=1
//        }
//        while merge.count != max+1 && j < nums2.count {
//            merge.append(nums2[j])
//            j+=1
//        }
//        return Double(merge[min]+merge[max])/2.0
//
//    }
    
    class func rewrite_findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count == 0 && nums2.count == 0 {
            return 0.0
        }
        var min = 0
        var max = 0
        let count = nums1.count+nums2.count
        if count%2 == 1 {
            min = count/2
            max = min
        } else {
            max = count/2
            min = max-1
        }
        var i = 0
        var j = 0
        var t = 0
        var minValue = 0
        var maxValue = 0
        while i < nums1.count && j < nums2.count {
            var value = 0
            if nums1[i] <= nums2[j] {
                value = nums1[i]
                i+=1
            } else {
                value = nums2[j]
                j+=1
            }
            t+=1
            if t == min+1 {
                minValue = value
            }
            if t == max+1 {
                maxValue = value
                break
            }
        }
        
        while i < nums1.count {
            t+=1
            if t == min+1 {
                minValue = nums1[i]
            }
            if t == max+1 {
                maxValue = nums1[i]
                break
            }
            i+=1
        }
        
        while j < nums2.count {
            t+=1
            if t == min+1 {
                minValue = nums2[j]
            }
            if t == max+1 {
                maxValue = nums2[j]
                break
            }
            j+=1

        }
        return Double(minValue+maxValue)/2.0

    }
}


