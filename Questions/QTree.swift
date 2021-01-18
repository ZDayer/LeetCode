//
//  QTree.swift
//  Questions
//
//  Created by zhaoyang on 2020/11/9.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

        
/*
 给定两个二叉树，编写一个函数来检验它们是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

 示例 1:

 输入:       1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 输出: true
 示例 2:

 输入:      1          1
           /           \
          2             2

         [1,2],     [1,null,2]

 输出: false
 示例 3:

 输入:       1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/same-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class Q100: NSObject {
    
    
    class func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var nodes = [root!]
        var result: [[Int]] = []
        while !nodes.isEmpty {
            var list = [Int]()
            for _ in 0..<nodes.count {
                let node = nodes.first!
                list.append(node.val)
                if let left = node.left {
                    nodes.append(left)
                }
                if let right = node.right {
                    nodes.append(right)
                }
                nodes.removeFirst()
            }
            result.append(list)
        }
        return result.reversed()
    }
    
    /*  前序遍历
     var nodes = [root!]
     
     while !nodes.isEmpty {
         let node = nodes.popLast()!
         print(node.val)
         if let right = node.right {
             nodes.append(right)
         }
         
         if let left = node.left {
             nodes.append(left)
         }
     }
     */
    
    /* 中序遍历
     if root != nil {
        var nodes = [TreeNode]()
         var node = root
         while node != nil || !nodes.isEmpty {
             while node != nil {
                 nodes.append(node!)
                 node = node?.left
             }
             
             if !nodes.isEmpty {
                 node = nodes.popLast()!
                 print(node!.val)
                 node = node?.right
             }
         }
     }
     */
    
    /* 后序, 取巧
     var list = [Int]()
     if root != nil {
         var nodes = [root!]
         while !nodes.isEmpty {
             let node = nodes.popLast()!
             list.append(node.val)
             if let left = node.left {
                 nodes.append(left)
             }
             if let right = node.right {
                 nodes.append(right)
             }
         }
     }
     for i in list.reversed() {
         print(i)
     }
     */

    class func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if (p == nil && q != nil) || (p != nil && q == nil) { return false }
        if p?.val != q?.val { return false }
        var result = isSameTree(p?.left, q?.left)
        if !result {
            return result
        }
        result = isSameTree(p?.right, q?.right)
        if !result {
            return result
        }
        return true
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        if (root?.left == nil && root?.right != nil) || (root?.left != nil && root?.right == nil) { return false }
        return isSmaeMTree(root?.left, root?.right)
    }
    
    func isSmaeMTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p != nil && q != nil {
            
            if p?.val != q?.val {
                return false
            }
            var result = isSmaeMTree(p?.left, q?.right)
            if !result {
                return result
            }
            result = isSmaeMTree(p?.right, q?.left)
            if !result {
                return result
            }
        }
        
        if (p == nil && q != nil) || (p != nil && q == nil) {
            return false
        }
        
        return true
    }
    
//    树的遍历方式总体分为两类：深度优先搜索（DFS）、广度优先搜索（BFS）；
//
//    常见的 DFS ： 先序遍历、中序遍历、后序遍历；
//    常见的 BFS ： 层序遍历（即按层遍历）。
    
    
    
    class func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }

    
    class func matrixScore(_ A: [[Int]]) -> Int {
        if A.count == 0 {
            return 0
        }
        var nums = A
        var reversal = Array(repeating: 0, count: A.first!.count)
        for i in 0..<nums.count {
            var arr = nums[i]
            if arr.first == 0 {
                reversalNumbs(nums: &arr)
            }
            nums[i] = arr
            for j in 0..<arr.count {
                if arr[j] == 0 {
                    reversal[j] -= 1
                } else if arr[j] == 1 {
                    reversal[j] += 1
                }
            }
        }
        var total = 0
        for arr in nums {
            var subTotal = 0
            for i in 0..<arr.count {
                subTotal = subTotal * 2 + (reversal[i] > 0 ? arr[i] : arr[i] == 0 ? 1 : 0)
            }
            total += subTotal
        }
        return total
    }
    
    class func reversalNumbs(nums: inout [Int]) {
        for i in 0..<nums.count {
            let num = nums[i] == 0 ? 1 : 0
            nums[i] = num
        }
    }
    
//    class func splitIntoFibonacci(_ S: String) -> [Int] {
////        123456579
//        var result = [Int]()
//        var tempFib = [Int]()
//
//
//
//        return [0]
//    }
//
//    class func splitFunc() {
//
//    }
    
    
    class func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        return fib(n-1) + fib(n-2)
    }
    
    class func fib2(_ n: Int) -> Int {
        var results = Array(repeating: 0, count: n+1)
        for i in 0...n {
            if i < 2 {
                results[i] = i
            } else {
                results[i] = results[i-1] + results[i-2]
            }
        }
        return results.last!
    }
    
    
    class func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // m * n
        var result = Array(repeating: Array(repeating: 1, count: m), count: n)
        for i in 1..<n {
            for j in 1..<m {
                result[i][j] = result[i-1][j] + result[i][j-1]
            }
        }
        return result[n-1][m-1]
    }
    
    
    // Q860
    class func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0
        var ten = 0
        for bill in bills {
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                if five > 0 {
                    five -= 1
                    ten += 1
                } else {
                    return false
                }
            } else if bill == 20 {
                if ten > 0 && five > 0 {
                    ten -= 1
                    five -= 1
                } else if five > 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }
        return true
    }
    
   // Q 649
    
//    class func predictPartyVictory(_ senate: String) -> String {
//        if senate.count == 0 { return "" }
//
//        var radiant = 0
//        var dire = 0
//
//        var senator = [Character]()
//        var last = true
//        for i in senate {
//            if senator.count == 0 {
//                senator.append(i)
//                if i == "R" {
//                    radiant += 1
//                } else if i == "D" {
//                    dire += 1
//                }
//            } else {
//                if last {
//                    if senator.last == "R" {
//                        if i == "R" {
//                            senator.append(i)
//                            radiant += 1
//                        } else {
//                            last = !last
//                        }
//                    } else if senator.last == "D" {
//                        if i == "D" {
//                            senator.append(i)
//                            dire += 1
//                        } else {
//                            last = !last
//                        }
//                    }
//                } else {
//                    last = !last
//                    senator.append(i)
//                    if i == "R" {
//                        radiant += 1
//                    } else if i == "D" {
//                        dire += 1
//                    }
//                }
//            }
//        }
//
//        print(radiant, dire, senator)
//        while radiant > 0 && dire > 0 {
//            for (i, j) in senator.enumerated() {
//                if last {
//                    if senator.last == "R" {
//                        if j == "D" {
//                            senator.remove(at: i)
//                            dire -= 1
//                            last = !last
//                        }
//                    } else if senator.last == "D" {
//                        if j == "R" {
//                            senator.remove(at: i)
//                            radiant -= 1
//                            last = !last
//                        }
//                    }
//                } else {
//                    if (senator.last == "R" && j == "R") || (senator.last == "D" && j == "D") {
//                        last = !last
//                    }
//                }
//            }
//        }
//
//        var result = ""
//        if radiant > 0 && dire == 0 {
//            result = "Radiant"
//        } else if radiant == 0 && dire > 0 {
//            result = "Dire"
//        }
//        return result
//    }
 
    class func predictPartyVictory(_ senate: String) -> String {
        
        var radiant = [Int]()
        var dire = [Int]()
        
        for (i, senator) in senate.enumerated() {
            if senator == "R" {
                radiant.append(i)
            } else {
                dire.append(i)
            }
        }
        
        let count = senate.count
        while !radiant.isEmpty && !dire.isEmpty {
            let rFirst = radiant.removeFirst()
            let dFirst = dire.removeFirst()
            
            if rFirst < dFirst {
                radiant.append(rFirst+count)
            } else {
                dire.append(dFirst+count)
            }
        }

        return radiant.isEmpty ? "Dire" : "Radiant"
    }
    
    // Q49
    class func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String : [String]]()
        for str in strs {
            let sortStr = String(str.sorted())
//            let value = result[sortStr]
//            if value != nil {
//                result[sortStr]?.append(str)
//            } else {
//                result[sortStr] = [str]
//            }
            result[sortStr, default: []].append(str)
        }
        return Array(result.values)
    }
    
    /// Q738
//    class func monotoneIncreasingDigits(_ N: Int) -> Int {
//        var result = N
//        while true {
//            let a = getResult(result)
//            if a.0 == false {
//                result = a.1 - 1
//            } else {
//                break
//            }
//        }
//
//        return result
//    }
//
//    class func getResult(_ N: Int) -> (Bool, Int) {
//        var result = true
//        var nextNum = N
//        if N < 10 {
//            return (result, N)
//        } else {
//            var num = 0
//            var nums = [Int]()
//            while N%Int(pow(Double(10), Double(num))) != N {
//                nums.append(N/Int(pow(Double(10), Double(num)))%10)
//                num += 1
//            }
//            var index = 0
//            for i in (0..<nums.count-1).reversed() {
//                if nums[i+1] > nums[i] {
//                    result = false
//                    index = i
//                    break
//                }
//            }
//            if !result {
//                var value = 0
//                for i in (index..<nums.count).reversed() {
//                    value = value * 10 + nums[i]
//                }
//                nextNum = value * Int(pow(Double(10), Double(index)))
//            }
//        }
//        return (result, nextNum)
//    }
    
    // 官方解法, 贪心
    class func monotoneIncreasingDigits(_ N: Int) -> Int {
        //个位数直接返回
        if N < 10 {
            return N
        }
        var arr: [Int] = String(N).compactMap({Int(String($0))})
        var index: Int = 1
        //从高位到低位找出递增的位数；后面全部替换为9
        while index < arr.count && arr[index-1] <= arr[index] {
            index += 1
        }
        
        if index < arr.count {
            //当之前递增的因为最后一位-1，可能变为不递增，所以此处需要处理下
            while index > 0 && arr[index-1] > arr[index] {
                arr[index-1] = arr[index-1]-1
                index -= 1
            }
            //将之后的全部替换为9
            for item in index+1 ..< arr.count {
                arr[item] = 9
            }
        }
        
        //组装数据
        var result = 0
        for item in arr {
            result = result * 10 + item
        }
        return result
    }
    
    
    // Q 290
    class func wordPattern(_ pattern: String, _ s: String) -> Bool {
        if pattern.count == 0 || s.count == 0 {
            return false
        }
        let strs = s.split(separator: " ")
        if pattern.count != strs.count {
            return false
        }
        
        var dic = [Character : String]()
        for (i, key) in pattern.enumerated() {
            let value = strs[i]
            let dicValue = dic[key]
            
            if dicValue == nil {
                if dic.values.contains(String(value)) {
                    return false
                }
                dic[key] = String(value)
            } else {
                if dicValue! != value {
                    return false
                }
            }
        }
        return true
    }
    // 前k个数, 最大
    // 最长递增数组, 上升子序列,
    // Q121, Q122, Q123
    class func maxProfit(_ prices: [Int]) -> Int {
        // 按照题解: 动态规划
        if prices.count < 2 {
            return 0
        }
        var array = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: 3), count: prices.count)
        /*
         0 0 0: 无交易,无持股
         0 0 1: 无交易, 持股 -- 不可能
         0 1 0: 有交易, 无持股 -- 不可能
         0 1 1: 有交易, 持股 -- -prices[0]
         0 2 0: 交易两次, 无持股 -- 不可能
         0 2 1: 交易两次, 持股 -- 不可能
         */
        array[0][1][1] = -prices[0]
        array[0][2][1] = Int(Int32.min) // 后续参与转态转移, 不能设置为 0
        for i in 1..<prices.count {
//            array[i][0][0]; // 无交易, 无持股, 无需考虑
//            array[i][0][1]; // 无交易, 持股, 不可能
            
            // 有交易无持股, 前一天有交易无持股状态, 或 前一天有交易持股卖出
            array[i][1][0] = max(array[i-1][1][0], array[i-1][1][1]+prices[i])
            // 有交易持股, 前一天有交易持股状态, 或 前一天无交易无持股买入(当天价格负值)
            array[i][1][1] = max(array[i-1][1][1], -prices[i])
            // 交易两次无持股, 前一天交易两次无持股, 或前一天交易两次持股卖出
            array[i][2][0] = max(array[i-1][2][0], array[i-1][2][1]+prices[i])
            // 交易两次持股, 前一天交易两次持股, 或前一天交易一次无持股买入
            array[i][2][1] = max(array[i-1][2][1], array[i-1][1][0]-prices[i])
        }
        return max(array[prices.count-1][1][0], array[prices.count-1][2][0])
    }
    
    class func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        
        // 按照题解: 动态规划
        if prices.count < 2 {
            return 0
        }
       /*
         arr[i][0] : 今天不持股, 利润:
         1. 昨天不持股, 等于昨天不持股的利润
         2. 昨天持股, 等于昨天持股的利润减去今天的价格
         
         arr[i][1]: 今天持股, 利润
         1. 昨天不持股, 等于昨天的利润减去今天价格
         2. 昨天持股, 等于昨天持股利润
         
         */
        var arr = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
        arr[0][0] = 0
        arr[0][1] = -prices[0]
        for i in 1..<prices.count {
            arr[i][0] = max(arr[i-1][0], arr[i-1][1]+prices[i]-fee)
            arr[i][1] = max(arr[i-1][1], arr[i-1][0]-prices[i])
        }
        return arr[prices.count-1][0] // 不持股是利润最高
        
    }
    
    
    
    class func findTheDifference(_ s: String, _ t: String) -> Character {
        if s.count == 0 {
            return Character(t)
        }
        
//        var sArr = Array(repeating: 0, count: 26)
//        var tArr = Array(repeating: 0, count: 26)
//        let aValue = Character("a").asciiValue!
        
//        for i in s {
//            sArr[Int(i.asciiValue!-aValue)] += 1
//        }
//        for i in t {
//            tArr[Int(i.asciiValue!-aValue)] += 1
//        }
//
//
//        for i in 0..<s.count {
//            let index1 = s.index(s.startIndex, offsetBy: i)
//            let index2 = s.index(after: index1)
//            let subS = Character(String(s[index1..<index2]))
//            let subT = Character(String(t[index1..<index2]))
//            sArr[Int(subS.asciiValue!-aValue)] += 1
//            tArr[Int(subT.asciiValue!-aValue)] += 1
//        }
//        tArr[Int(t.last!.asciiValue!-aValue)] += 1
//
//        var result = ""
//        for i in 0..<26 {
//            if sArr[i] != tArr[i] {
//                result = String(UnicodeScalar(UInt8(i) + aValue))
//            }
//        }
        
        var sValue = 0
        var tValue = 0
        for i in s {
            sValue += Int(i.asciiValue!)
        }
        for i in t {
            tValue += Int(i.asciiValue!)
        }
        
        return Character(String(UnicodeScalar(UInt8(tValue-sValue))))
    }
    
    
    
//    var indexs = Array(repeating: -1, count: 26)
//    let value = Character("a").asciiValue!
//    for(i, c) in S.enumerated() {
//        indexs[Int(c.asciiValue! - value)] = i
//    }
//
//    print(indexs)
//    var result = [Int]()
//    var start = 0, end = 0
//    for (i, c) in S.enumerated() {
//        end = max(end, indexs[Int(c.asciiValue! - value)])
//        if i == end {
//            result.append(end-start+1)
//            start = end+1
//        }
//    }
//    return result
    
    
    // Q746 动态规划
    class func minCostClimbingStairs(_ cost: [Int]) -> Int {
        /*
        // cost 的长度将会在 [2, 1000]。
        // 对于阶梯对应的体力花费理解为
        // 每个台阶的停留花费
        // 在上到第一、二个台阶前, 没有花费, 则 total[0] = total[1] = 0
        var total = Array(repeating: 0, count: cost.count+1)
        for i in 2..<total.count {
            // 第i个台阶的花费为
            // 到达第i-2个台阶的花费 + 第i-2个台阶的停留花费
            // 到达第i-1个台阶的花费 + 第i-1个台阶的停留花费
            // 最小值
            let value = min(total[i-2]+cost[i-2], total[i-1]+cost[i-1])
            total[i] = value
        }
        return total.last!
        */
        
        // 官解, 空间优化
        var total = 0
        var cost1 = 0 // 第i-2台阶的花费
        var cost2 = 0 // 第i-1台阶的花费
        for i in 2...cost.count {
            total = min(cost1+cost[i-2], cost2+cost[i-1]) // 第i个台阶
            cost1 = cost2 // 对下一个台阶 i+1 来说, cost2 已经是第i-2个台阶的花费
            cost2 = total // 对下一个台阶 i+1 来说, total 已经是第i-1个台阶的花费
        }
        return total
    }
    
    
    class func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [[Int]]() }
        var values = [[Int]]()
        var nodes = [root!]
        var reverse = false
        while nodes.count != 0 {
            var list = [Int]()
            for _ in 0..<nodes.count {
                let node = nodes.first!
                nodes.removeFirst()
                list.append(node.val)
                if node.left != nil {
                    nodes.append(node.left!)
                }
                if node.right != nil {
                    nodes.append(node.right!)
                }
            }
            values.append(reverse ? list.reversed() : list)
            reverse = !reverse
        }
        return values
    }
    
    class func climbStairs(_ n: Int) -> Int {
        if n < 2 { return n }
//        var nums = Array(repeating: 0, count: n+1)
//        nums[0] = 1
//        nums[1] = 1
//        for i in 2...n {
//            nums[i] = nums[i-2]+nums[i-1]
//        }
//        return nums.last!
//
        // 空间优化
        // 只与前两台阶有关
        var total = 0
        var step1 = 1
        var step2 = 1
        for _ in 2...n {
            total = step1+step2
            step1 = step2
            step2 = total
        }
        return total
    }
    
    class func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        if nums.count == 1 { return nums.first! }
//        var money = Array(repeating: 0, count: nums.count)
//        money[0] = nums[0]
//        money[1] = max(nums[0], nums[1])
//
//        for i in 2..<nums.count {
//            money[i] = max(money[i-2]+nums[i], money[i-1])
//        }
//        return money.last!
        
        // 空间优化
        var total = 0
        var house1 = nums[0]
        var house2 = max(nums[0], nums[1])
        total = max(house1, house2)
        for i in 2..<nums.count {
            total = max(house1+nums[i], house2)
            house1 = house2
            house2 = total
        }
        return total
    }
    
    class func maxSubArray(_ nums: [Int]) -> Int {
        // 1 <= arr.length <= 10^5
        if nums.count == 1 { return nums.first! }
//        var total = Array(repeating: 0, count: nums.count)
//        total[0] = nums[0]
//        for i in 1..<nums.count {
//            // 连续子数组, 从前面包含自身 或 自身
//            total[i] = max(total[i-1]+nums[i], nums[i])
//        }
//        var maxValue = total[0]
//        for num in total {
//            maxValue = max(num, maxValue)
//        }
//        return maxValue
        
        // 空间优化, 只与前部分的大小有关
        var maxValue = nums[0]
        var result = maxValue
        for i in 1..<nums.count {
            maxValue = max(maxValue+nums[i], nums[i])
            result = max(result, maxValue)
        }
        return result
    }
    
    
    class func waysToStep(_ n: Int) -> Int {
        if n < 3 {  return n }
        if n == 3 {  return 4 }
        var total = 0
        var step1 = 1
        var step2 = 2
        var step3 = 4
        for _ in 4...n {
            total = (step1+step2+step3)%1000000007
            step1 = step2
            step2 = step3
            step3 = total
        }
        return total
    }
    
    
    class func isSubsequence(_ s: String, _ t: String) -> Bool {
        if t.count == 0 && s.count > 0 { return false }
        var sCount = 0
        var tCount = 0
        while sCount < s.count && tCount < t.count {
            let sIndex1 = s.index(s.startIndex, offsetBy: sCount)
            let sIndex2 = s.index(after: sIndex1)
            let sCh = s[sIndex1..<sIndex2]
            
            let tIndex1 = t.index(t.startIndex, offsetBy: tCount)
            let tIndex2 = t.index(after: tIndex1)
            let tCh = t[tIndex1..<tIndex2]
            if sCh == tCh {
                sCount += 1
            }
            tCount += 1
        }
        return sCount == s.count
    }
    
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        
        
        
        return false
        
    }
    
    func treeLeafs(_ root: TreeNode?) -> [Int] {
        
        
        return [Int]()
    }
    
    
    class func firstUniqChar(_ s: String) -> Int {
        var result = -1
        if s.count == 1 { result = 0 }
        
        /*
        var count = Array(repeating: 0, count: 26)
        var dic = [Character : Int]()
        let aValue = Character("a").asciiValue!
        for (i, ch) in s.enumerated() {
            let index = Int(ch.asciiValue!-aValue)
            count[index] += 1
            if count[index] < 2 {
                dic[ch] = i
            } else {
                dic.removeValue(forKey: ch)
            }
        }
                
        if dic.count > 0 {
//            var minValue = dic.values.first!
//            for i in dic.values {
//                minValue = min(i, minValue)
//            }
//            result = max(minValue, result)
            let allkeys = dic.keys
            for ch in s {
                if allkeys.contains(ch) {
                    result = dic[ch]!
                    break
                }
            }
        }
 */
        var count = Array(repeating: 0, count: 26)
        var chs = Set<Character>()
        let aValue = Character("a").asciiValue!
        for ch in s {
            let index = Int(ch.asciiValue!-aValue)
            count[index] += 1
            if count[index] < 2 {
                chs.insert(ch)
            } else {
                chs.remove(ch)
            }
        }
        if chs.count > 0 {
            for (i, ch) in s.enumerated() {
                if chs.contains(ch) {
                    result = i
                    break
                }
            }
        }

        return result
    }
    
    
    
    func readBinaryWatch(_ num: Int) -> [String] {
        let result = [String]()

        return result
    }
    
    
    class func numList(_ num: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var track = [Int]()
        backTrack(num, &track, &result)
        return result
    }
    
    // 路径：记录在 track 中
    // 选择列表：nums 中不存在于 track 的那些元素
    // 结束条件：nums 中的元素全都在 track 中出现
    class
    func backTrack(_ nums: [Int], _ track: inout [Int], _ result: inout [[Int]]) {
        // // 触发结束条件
        if track.count == nums.count {
            result.append(track)
            return
        }

        for num in nums {
            if track.contains(num) {
                continue
            }
            
            track.append(num)
            backTrack(nums, &track, &result)
            track.removeLast()
        }
    }
    
    class func testMethod(_ num: inout [Int]) -> [Int] {
        var result = [Int]()
        print("=======")
        print(num)
        for i in 0..<num.count {
            print(i)
            result.append(num[i])
            num.remove(at: i)
            print(num)
            if num.count > 0 {
                result += testMethod(&num)
            }
        }
        
        
       print(result)
        return result
    }
    
    
    class func candy(_ ratings: [Int]) -> Int {
        if ratings.count < 2 { return ratings.count }
        
        var nums = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i-1] { nums[i] = nums[i-1] + 1 }
        }
        
        var total = 0
        for i in (0..<ratings.count-1).reversed() {
            if ratings[i] > ratings[i+1] {
                nums[i] = max(nums[i], nums[i+1]+1)
            }
            total += nums[i]
        }
        total += nums.last!
        
        return total
    }
    
    
    class func method(_ n: Int, _ p: Int) -> Int {
        var slices = 1
        var cnt = 0
        while slices < n {
            cnt += 1
            slices += min(slices, p)
        }
        return cnt
    }
    
    func cake(_ N: Int) -> Int {
        
        
        
        return 0
    }
    
    
    class func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gsort = g.sorted()
        let ssort = s.sorted()
        
        var result = 0
        var gindex = 0
        var sindex = 0
        print(gsort, ssort)
        while gindex < gsort.count && sindex < ssort.count {
            if ssort[sindex] >= gsort[gindex] {
                result += 1
                gindex += 1
                sindex += 1
            } else {
                sindex += 1
            }
        }
        return result
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count > 1 {
            var array = Set<Int>()
            for num in nums {
                if array.contains(num) {
                    return true
                } else {
                    array.insert(num)
                }
            }
        }
        return false
    }
    
    
    class func maxProfits(_ prices: [Int]) -> Int {
//        if prices.count < 2 { return 0 }
//        var array = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
//        array[0][1] = -prices[0]
//        // array[i][0] 第i天不持股的最大利润
//        // array[i][1] 第i天持股的最大利润
//        for i in 1..<prices.count {
//            array[i][0] = max(array[i-1][0], array[i-1][1]+prices[i])
//            array[i][1] = i > 1 ? max(array[i-1][1], array[i-2][0]-prices[i]) : array[i-1][1]
//        }
//        return array[prices.count-1][0]
        
        // 官解
        // 增加冷冻期状态
        if prices.count < 2 { return 0 }
        var array = Array(repeating: Array(repeating: 0, count: 3), count: prices.count)
        // 状态指 i天结束后, 买卖股票后的转态
        array[0][0] = -prices[0] // 持股
        // 数组初始化已经设置了
//        array[0][1] = 0 // 非冷冻期不持股
//        array[0][2] = 0 // 冷冻期不持股
        
        for i in 1..<prices.count {
            // 持股: i-1天持股, i-1天非冷冻期不持股购买股票
            array[i][0] = max(array[i-1][0], array[i-1][1]-prices[i])
            // 非冷冻期不持股, 非冷冻期: i-1天一定不持有股票
            array[i][1] = max(array[i-1][1], array[i-1][2])
            // 冷冻期不持股
            array[i][2] = array[i-1][0]+prices[i]
        }
        return max(array[prices.count-1][1], array[prices.count-1][2])
    }
    
    
    class func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        if prices.count < 2 || k == 0 { return 0 }
        // k次, 需要 array[prices.count-1][k+1][2] 数组, 需要优化空间
        // 转态转换仅与前一天有关, 可以使用 array[k+1][2]
        var array = Array(repeating: Array(repeating: Int.min, count: 2), count: k+1)
        array[0][0] = 0
        array[1][1] = -prices[0]
        for i in 1..<prices.count {
            for j in 1...k {
                // 与天无关
                array[j][0] = max(array[j][0], array[j][1]+prices[i])
                array[j][1] = max(array[j][1], array[j-1][0]-prices[i])
            }
        }
        var profit = Int.min
        for money in array {
            profit = max(money[0], profit)
        }
        return profit
    }
    

    class func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        // 条件, 不需要考虑 有一个为空, 或 a = 0 情况
        // 3 <= list1.length <= 104
        // 1 <= a <= b < list1.length - 1
        // 1 <= list2.length <= 104
        var header = list1
        
        var count = 0
        var node = list1
        while node != nil {
            if count == a-1 {
                header = node
            }
            if count == b {
                break
            }
            node = node!.next
            count += 1
        }
        
        var node1 = list2
        while node1?.next != nil {
            node1 = node1!.next
        }
        header?.next = list2
        node1?.next = node?.next

        return list1
    }
    
    
    class func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }

    class func reverseString(_ s: inout [Character]) {

        if s.count < 2 { return }
        
        var begin = 0
        var end = s.count-1
        
        while begin < end {
            let temp = s[begin]
            s[begin] = s[end]
            s[end] = temp
            begin += 1
            end -= 1
        }

    }
    
    
    
    class func lastStoneWeight(_ stones: [Int]) -> Int {
        var weights = stones
        calculteStone(&weights)
        return weights.count == 0 ? 0 : weights.first!
    }
    
    class func calculteStone(_ stones: inout [Int]) {
        if stones.count < 2 { return }
        
        stones.sort()
        let weight1 = stones.popLast()!
        let weight2 = stones.popLast()!
        let value = abs(weight2-weight1)
        if value != 0 {
            stones.append(value)
        }
        calculteStone(&stones)
    }
    
    
    // 树遍历
    // 前序, 递归
    class func treeOrderFunc1(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var result = [Int]()
        result.append(root!.val)
        result += treeOrderFunc1(root?.left)
        result += treeOrderFunc1(root?.right)
        return result  
    }
    
    class func treeOrderFunc11(_ root: TreeNode?) -> [Int] {
        
        var result = [Int]()
        if root == nil { return result }
        var nodes = [root!]
        while !nodes.isEmpty {
            let tempNode = nodes.popLast()!
            result.append(tempNode.val)
            if tempNode.right != nil {
                nodes.append(tempNode.right!)
            }
            
            if tempNode.left != nil {
                nodes.append(tempNode.left!)
            }
        }
        return result
    }
    
    
    
    // 中序
    class func treeOrderFunc2(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var result = [Int]()
        result += treeOrderFunc2(root?.left)
        result.append(root!.val)
        result += treeOrderFunc2(root?.right)
        return result
    }
    
    class func treeOrderFunc22(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil { return result }
        var nodes = [TreeNode]()
        var node = root
        while node != nil || !nodes.isEmpty {
            while node != nil {
                nodes.append(node!)
                node = node?.left // 指向最左子结点
            }
            if !nodes.isEmpty {
                node = nodes.popLast()!
                result.append(node!.val)
                node = node?.right
            }
        }
        return result
    }
    
    // 后序
    class func treeOrderFunc3(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        var result = [Int]()
        result += treeOrderFunc3(root?.left)
        result += treeOrderFunc3(root?.right)
        result.append(root!.val)
        return result
    }
    
    class func treeOrderFunc33(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil { return result }
        var nodes = [TreeNode]()
        var node = root
        var pre: TreeNode? = nil
        while node != nil || !nodes.isEmpty {
            while node != nil {
                nodes.append(node!)
                node = node?.left
            }
            
            if !nodes.isEmpty {
                node = nodes.last!
                if node?.right == nil || node?.right?.val == pre?.val {
                    pre = node
                    result.append(nodes.popLast()!.val)
                    node = nil
                } else {
                    node = node?.right
                }
            }
        }
        
        
        return result
    }
    
    
    class func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var count = Array(repeating: 0, count: 26)
        let avalue = Character("a").asciiValue!
        
        for i in s {
            count[Int(i.asciiValue!-avalue)] += 1
        }
        print(count)
        
        for i in t {
            count[Int(i.asciiValue!-avalue)] -= 1
        }
        print(count)
        for i in count{
            if i != 0 {
                return false
            }
        }
        
        return true
    }
    
    class func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count == 0 || nums2.count == 0 {
            return [Int]()
        }
        var result = Set<Int>()
        let numsort1 = nums1.sorted()
        let numsort2 = nums2.sorted()
        var index1 = 0
        var index2 = 0
        
        while index1 < nums1.count && index2 < nums2.count {
            let num1 = numsort1[index1]
            let num2 = numsort2[index2]
            if num1 == num2 {
                result.insert(num1)
                index1 += 1
                index2 += 1
            } else if num1 < num2 {
                index1 += 1
            } else {
                index2 += 1
            }
        }
        return Array(result)
    }
    
    
    class func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var index1 = 0
        var index2 = 1
        var result = Array(repeating: 0, count: A.count)
        for i in A {
            if i%2 == 0 {
                result[index1] = i
                index1 += 2
            } else {
                result[index2] = i
                index2 += 2
            }
        }
        
        return result
        
    }
    
    // 官解 贪心
    class func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        
        var result = 0
        if intervals.count < 2 { return result }
        // 先进行排序
        let sort = intervals.sorted { (arr1, arr2) -> Bool in
            return arr1.first! < arr2.first!
        }
        var begin = sort.first!.first!
        var end = sort.first!.last!

        for i in 1..<sort.count {
            let v1 = sort[i].first!
            let v2 = sort[i].last!
            if v1 >= end {
                begin = v1
                end = v2
            } else {
                if begin == v1 {
                    end = min(end, v2)
                } else {
                    if v2 < end {
                        begin = v1
                        end = v2
                    }
                }
                result += 1
            }
        }
        return result
    }
    
    class func binary_search(_ sort: [Int], _ key: Int) -> Bool {
        if sort.count == 0 { return false }
        if sort.count == 1 { return key == sort.first! }
        
        var low = 0
        var high = sort.count-1
        while low <= high {
            let mid = (low+high)/2
            if sort[mid] < key {
                low = mid+1
            } else if sort[mid] > key {
                high = mid-1
            } else {
                return true
            }
        }
        return false
    }

    class func fibFunc(_ n: Int) -> Int {
        if n < 2 { return n }
        var v1 = 0
        var v2 = 1
        var result = 0
        for _ in 2...n {
            result = v1 + v2
            v1 = v2
            v2 = result
        }
        return result
    }
    
    
    class func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        if coins.count == 0 || amount < 0 { return -1 }
        var dp = Array(repeating: Int.max-1, count: amount+1)
        dp[0] = 0
        for coin in coins {
            if coin > amount { continue }
            for i in coin...amount {
                dp[i] = min(dp[i], dp[i-coin]+1)
            }
        }
        return dp[amount] == Int.max-1 ? -1 : dp[amount]
    }
    
    
    class func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        queensBackTrack(&result, &board, 0)
        return result
    }
    
    // 路径：board 中小于 row 的那些行都已经成功放置了皇后
    // 选择列表：第 row 行的所有列都是放置皇后的选择
    // 结束条件：row 超过 board 的最后一行
    class
    func queensBackTrack(_ result: inout [[String]], _ board: inout [[String]], _ row: Int) {
        if row == board.count {
            var temp = [String]()
            for str in board {
                temp.append(str.joined())
            }
            result.append(temp)
            return
        }
        // n = board.count  n * n  column 列
        // 关注当前 行 的每一 列 能否放
        for col in 0..<board.count {
            // 排除不合法选择
            if !isValid(board, row, col) {
                continue
            }
            // 做选择
            board[row][col] = "Q"
            // 进行下一行决策
            queensBackTrack(&result, &board, row+1)
            // 撤销选择
            board[row][col] = "."
        }
    }
    
    // 每一行, 每一列, 对角线 不能有
    // 当前行之前是已经放置成功的, 行上时不需要考虑的, 之后行不需要考虑
    class
    func isValid(_ board: [[String]], _ row: Int, _ col: Int) -> Bool {
        // 检查列是否冲突
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // 检查对角线
        var r = row-1
        var c = col-1
        while r >= 0 && c >= 0  {
            if board[r][c] == "Q" {
                return false
            }
            r -= 1
            c -= 1
        }
        
        r = row-1
        c = col+1
        while r >= 0 && c < board.count {
            if board[r][c] == "Q" {
                return false
            }
            r -= 1
            c += 1
        }
        
        return true
    }
    
    class func largeGroupPositions(_ s: String) -> [[Int]] {
        var result = [[Int]]()
        if s.count < 3 { return result }
        var length = 1
        var pre = s.first!
        var begin = 0
        var end = 0
        let arr = Array(s)
        for i in 1..<arr.count {
            if arr[i] == pre {
                end += 1
                length += 1
                if i == arr.count-1 && length > 2 {
                    let temp = [begin, end]
                    result.append(temp)
                }
            } else {
                if length > 2 {
                    let temp = [begin, end]
                    result.append(temp)
                }
                length = 1
                begin = i
                end = i
                pre = arr[i]
            }
        }
        return result
    }
    
    
    class func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        var high = 1
        var list = [root]
        // 层序遍历, 并每层单独遍历
        while !list.isEmpty {
            for _ in 0..<list.count {
                let node = list.removeFirst()!
                if node.left == nil && node.right == nil {
                    return high
                }
                
                if node.left != nil {
                    list.append(node.left!)
                }
                if node.right != nil {
                    list.append(node.right!)
                }
            }
            high += 1
        }
        return high
    }
    
    
    class func openLock(_ deadends: [String], _ target: String) -> Int {
        var step = 0
        var stack = ["0000"]
        var visited: Set<String> = ["0000"]
    var deadend : Set<String> = []
        for str in deadends {
            deadend.insert(str)
        }
        while !stack.isEmpty {
            let count = stack.count
            for _ in 0..<count { // 层
                let cur = stack.removeFirst()
                if deadend.contains(cur) {
                    continue
                }
                if cur == target {
                    return step
                }
                
                // 将当前数字转变的可能性加入stack中
                for i in 0..<4 {
                    let result = transformString(cur, i)
                    let string1 = result.0
                    let string2 = result.1
                    if !visited.contains(string1) {
                        stack.append(string1)
                        visited.insert(string1)
                    }
                    if !visited.contains(string2) {
                        stack.append(string2)
                        visited.insert(string2)
                    }
                }
            }
            step += 1
        }
        return -1
    }
    
    class func transformString(_ s: String, _ index: Int) -> (String, String) {
        var arr1 = Array(s)
        var value1 = arr1[index]
        value1 = value1 == "9" ? "0" : Character(String(Int(String(value1))!+1))
        arr1[index] = value1

        var arr2 = Array(s)
        var value2 = arr2[index]
        value2 = value2 == "0" ? "9" : Character(String(Int(String(value2))!-1))
        arr2[index] = value2
        return (String(arr1), String(arr2))
    }
    
    class func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count == 1 { return }
        var arr = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            let index = (i+k)%nums.count
            arr[index] = nums[i]
        }
        nums = arr
        
    }
    
    
    class func trailingZeroes(_ n: Int) -> Int {
        if n == 0 { return 0 }
        var count = 0
        var value = n
        while value > 0 {
            value = value/5
            count += value
        }
        return count
    }
    
    class func longestStr(_ s: String) -> (Character, Int) {
        if s.count == 0 { return (Character(""), 0) }
        if s.count == 1 { return (Character(s), 1) }
        let arr = Array(s)
        var ch = arr[0]
        var count = 1
        
        var pre = arr[0]
        var max = 1
        for i in 1..<arr.count {
            if arr[i] == pre {
                max += 1
            } else {
                max = 1
            }
            if max > count {
                count = max
                ch = pre
            }
            pre = arr[i]
        }
        return (ch, count)
    }
    
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next?.next
        while slow != nil && fast != nil {
            if slow?.val == fast?.val {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
    
    // Q1018
    class func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        var result: [Bool] = []
        var remainder = 0
        for num in A {
            remainder = (remainder * 2 + num)%5
            if remainder == 0 {
                result.append(true)
            } else {
                result.append(false)
            }
            
        }
        return result
    }
    
    class func maxDepths(_ root: TreeNode?) -> [String] {
        if root == nil { return [String]() }
        // 深度搜索, 回溯
        var nodes = [TreeNode]()
        var paths = [String]()
        calculateDepath(root, &paths, &nodes)
        return paths
    }
    
    class
    func calculateDepath(_ root: TreeNode?, _ paths: inout [String], _ nodes: inout [TreeNode]) {
        if root == nil {
            return
        }
        if root?.left == nil && root?.right == nil {
            nodes.append(root!)
            var str = ""
            for node in nodes {
                str += String(node.val)
                str += "->"
            }
            str.removeLast()
            str.removeLast()
            paths.append(str)
            nodes.removeLast()
            return
        }
        nodes.append(root!)
        calculateDepath(root?.left, &paths, &nodes)
        calculateDepath(root?.right, &paths, &nodes)
        nodes.removeLast()
    }
    
    // Q76
    class func minWindow(_ s: String, _ t: String) -> String {
        let origin = Array(s)
        var need = [Character: Int]()
        var window = [Character: Int]()
        for c in t {
            if let count = need[c] {
                need[c] = count+1
            } else {
                need[c] = 1
            }
            window[c] = 0
        }
        var left = 0
        var right = 0
        var start = 0
        var len = s.count+1
        var valid = 0
        while right < origin.count {
            let c = origin[right]
            right += 1
            
            // 更新窗口
            if need.keys.contains(c) {
                window[c]! += 1
                if window[c] == need[c] {
                    valid += 1 // 用来记录是否全包含
                }
            }
//            print(window)
            while valid == need.count {
                
                // 更新 起始 位置, 计算长度
                if right-left < len {
                    start = left
                    len = right-start
                }

                let ch = origin[left]
                left += 1
                
                if need.keys.contains(ch) {
                    if window[ch] == need[ch] {
                        valid -= 1
                    }
                    window[ch]! -= 1
                }
            }
        }
        return len > s.count ? "" : String(origin[start..<start+len])
    }

    class func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1 == s2 { return true }
        let origin = Array(s2)
        var need = [Character:Int]()
        var window = [Character:Int]()
        for c in s1 {
            if let count = need[c] {
                need[c] = count+1
            } else {
                need[c] = 1
            }
            window[c] = 0
        }
        var left = 0
        var right = 0
        var vaild = 0
        while right < origin.count  {
            let c = origin[right]
            right += 1
            
            if need.keys.contains(c) {
                window[c]! += 1
                if window[c] == need[c] {
                    vaild += 1
                }
            }
            
            while right-left >= s1.count {
                if vaild == need.count {
                    return true
                }
                let ch = origin[left]
                left += 1
                if need.keys.contains(ch) {
                    if window[ch] == need[ch] {
                        vaild -= 1
                    }
                    window[ch]! -= 1
                }
            }
        }
        return false
    }
    
    class func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var result = [Int]()
        let origin = Array(s)
        var need = [Character:Int]()
        var window = [Character:Int]()
        for c in p {
            if let count = need[c] {
                need[c] = count+1
            } else {
                need[c] = 1
            }
            window[c] = 0
        }
        var left = 0
        var right = 0
        var vaild = 0
        while right < origin.count {
            let c = origin[right]
            right += 1
            
            if need.keys.contains(c) {
                window[c]! += 1
                if window[c] == need[c] {
                    vaild += 1
                }
            }

            while right-left >= p.count {
                if vaild == need.count {
                    result.append(left)
                }
                
                let ch = origin[left]
                left += 1
                if need.keys.contains(ch) {
                    if window[ch] == need[ch] {
                        vaild -= 1
                    }
                    window[ch]! -= 1
                }
            }
        }
        return result
    }
}

