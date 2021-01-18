//
//  Q973.swift
//  Questions
//
//  Created by zhaoyang on 2020/11/9.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation

class Q973 : NSObject {
    /*
     我们有一个由平面上的点组成的列表 points。需要从中找出 K 个距离原点 (0, 0) 最近的点。

     （这里，平面上两点之间的距离是欧几里德距离。）

     你可以按任何顺序返回答案。除了点坐标的顺序之外，答案确保是唯一的。

      

     示例 1：

     输入：points = [[1,3],[-2,2]], K = 1
     输出：[[-2,2]]
     解释：
     (1, 3) 和原点之间的距离为 sqrt(10)，
     (-2, 2) 和原点之间的距离为 sqrt(8)，
     由于 sqrt(8) < sqrt(10)，(-2, 2) 离原点更近。
     我们只需要距离原点最近的 K = 1 个点，所以答案就是 [[-2,2]]。
     示例 2：

     输入：points = [[3,3],[5,-1],[-2,4]], K = 2
     输出：[[3,3],[-2,4]]
     （答案 [[-2,4],[3,3]] 也会被接受。）
      

     提示：

     1 <= K <= points.length <= 10000
     -10000 < points[i][0] < 10000
     -10000 < points[i][1] < 10000


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/k-closest-points-to-origin
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
//    class func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
//        let sort = points.sorted {
//            (pow(Double($0[0]), 2)+pow(Double($0[1]), 2)) < (pow(Double($1[0]), 2)+pow(Double($1[1]), 2))
//        }
//        return Array(sort[0..<K])
//    }



    class func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var result = [[Int]]()
        let points = points.sorted(){ _sqrt($0) < _sqrt($1)}
        for i in 0..<K{
            result.append(points[i])
        }
        return result
    }

    class func _sqrt(_ points:[Int])->Int{
        return Int(pow(Double(points[0]), 2) + pow(Double(points[1]), 2))
    }

}
