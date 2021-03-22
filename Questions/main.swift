//
//  main.swift
//  Questions
//
//  Created by zhaoyang on 2020/6/11.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import Foundation

//let num1 = [1]
//let num2 = [1]
//let num1 : [Int] = []
//let num2 : [Int] = []

//print(QFour.findMedianSortedArrays(num1, num2))


//print(QFour.rewrite_findMedianSortedArrays(num1, num2))

//let numss = [1, 2, 5, 6, 7, 8, 22]
//print(QOne.twoSum(numss, 11))

//let s = "abcabcbb"
//let s = "pwwkew"
//let s = "bbtablud"
// let s = "bbbbbb"
//let s = "loddktdji"
//let s = "ba"
//let s = "abba"
//print("lenght = \(QThree.lengthOfLongestSubstring(s))")


//let s = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
//let s = "bacbc"
//print("result = \(QFive.longestPalindrome(s))")

//let index1 = s.index(s.startIndex, offsetBy: 0)
//let index2 = s.index(s.startIndex, offsetBy: 1)
//let sub = s[index1..<index2]
//print(sub)
   
//    0   1   2   3   4

//0   t   f   f   t   f
//
//1       t   f   f   f
//
//2           t   f   t
//
//3               t   f
//
//4                   t


//let s = "LEETCODEISHIRING"
// LCIRETOESIIGEDHN  3
/*
 L      C       I       R
 E  T   O   E   S   I   I   G
 E      D       H       N
 */
// LDREOEIIECIHNTSG  4
/*
 L          D           R
 E      O   E       I   I
 E  C       I   H       N
 T          S           G
 */

//print(QSix.convert(s, 3))

/*
0   0   0
1   1   0
2   2   0
3   3   0
 
4   0   1
5   1   1
6   2   1
7   3   1
 
8   0   2
9   1   2
10  2   2
11  3   2
 
12  0   3
13  1   3
14  2   3
15  3   3
*/

//let num = 1534236469
//print(QSeven.reverse(num))

//let s = "   -42"
//_ = QEight.myAtoi(s)

//let str = "(])"
//print(QTwenty.isValid(str))

//let A = ["bella","label","roller"]
//print(Q1002.commonChars(A))


//[1,3,1,2,0,5]
//3
//let nums = [1,3,1,2,0,5]
//print(Q239.maxSlidingWindow(nums, 3))

//let nums = [-4,-1,0,3,10]
//print(Q977.sortedSquares(nums))
// 输入：S = "ab#c", T = "ad#c"
//let S = "ab#c"
//let T = "ad#c"
//print(Q844.backspaceCompare(S, T))
//Q844.testMethod(S, T)

//let name = "vtkgn"
//let typed = "vttkgnn"
//_ = Q143.isLongPressedName(name, typed)


//let string = "ababcbacadefegdehijhklij"
//print(Q763.partitionLabels(string))
/*
let node6 = ListNode(1)
let node5 = ListNode(3, node6)
//let node4 = ListNode(2, node5)
//let node3 = ListNode(3, node4)
//let node2 = ListNode(4, node3)
//let node1 = ListNode(1, node2)
//print(QTwo.isPalindrome(node1))

//print(QTwo.reversePrint(node1))


var node = QTwo.partition(node5, 2)
while node != nil {
    print(node!.val)
    node = node?.next
}

print(Q704.search([-1,0,3,5,9,12], 9))

//print(Q704.missingNumber([0,1,3]))

print(Q973.kClosest([[3,3],[5,-1],[-2,4]], 2))

//let tree7 = TreeNode(7)
//let tree6 = TreeNode(6)
//let tree5 = TreeNode(5)
//let tree4 = TreeNode(4)
//let tree3 = TreeNode(3, tree6, tree7)
//let tree2 = TreeNode(2, tree4, tree5)
//let tree1 = TreeNode(1, tree2, tree3)
//
//print(Q100.levelOrder(tree1))


//
//print(Q100.preorderTraversal(tree1))

let A = [[0,0,1,1],[1,0,1,0],[1,1,0,0]]
print(Q100.matrixScore(A))

//let s = "123456579"
//print(Q100.splitIntoFibonacci(s))

//print(Q100.fib(13))
//print(Q100.fib2(92))

print(Q100.uniquePaths(7, 3))

let lemon = [5,5,5,10,20,10]
print(Q100.lemonadeChange(lemon))

print("===========")
let str = "DRRDD"
print(Q100.predictPartyVictory(str))


let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
print(Q100.groupAnagrams(strs))

//let num = 603253281
let num = 603
print(Q100.monotoneIncreasingDigits(num))

let pattern = "abba"
//let strr = "dog dog dog dog"
let strr = "dog cat cat fish"
print(Q100.wordPattern(pattern, strr))

print("-*-*-*-*-*-*-*-*-*-*-*-*")
//let price = [1, 2, 3, 4, 5]
//print(Q100.maxProfit(price))
//
////print(Q100.maxProfit([1, 3, 2, 8, 4, 9], 2))
//
//let strrr = "abcd"
//for i in 0..<strrr.count {
//    let index1 = strrr.index(strrr.startIndex, offsetBy: i)
//    let index2 = strrr.index(after: index1)
//    let s = strrr[index1..<index2]
//    print(s, type(of: s))
//    print(Character(String(s)).asciiValue!)
//}

let cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
print(Q100.minCostClimbingStairs(cost))



let tree5 = TreeNode(5)
let tree4 = TreeNode(4)
let tree3 = TreeNode(3, nil, tree5)
let tree2 = TreeNode(2, tree4, nil)
let tree1 = TreeNode(1, tree2, tree3)

print(Q100.zigzagLevelOrder(tree1))


print(Q100.climbStairs(3))


let money = [-2,1,-3,4,-1,2,1,-5,4]
//print(Q100.rob(money))
print(Q100.maxSubArray(money))

print(Q100.waysToStep(61))

print(Q100.isSubsequence("axc", "ahbgdc"))

print(Q100.firstUniqChar("leetcode"))

print(Q100.numList([1, 2, 3]))

//print(Q100.candy([2, 1]))
//
//print(Q100.method(100, 5))

//print(Q100.findContentChildren([10, 9, 8, 7], [10, 9, 8, 7]))


let price = [2, 1, 4]
//print(Q100.maxProfits(price))
print(Q100.maxProfit(2, price))


//let list0 = ListNode(6)
//let list1 = ListNode(5, list0)
//let list2 = ListNode(4, list1)
//let list3 = ListNode(3, list2)
//let list4 = ListNode(2, list3)
//let list5 = ListNode(1, list4)
//let list6 = ListNode(0, list5)
//
//
//let list777 = ListNode(1000004)
//let list77 = ListNode(1000003, list777)
//let list7 = ListNode(1000002, list77)
//let list8 = ListNode(1000001, list7)
//let list9 = ListNode(1000000, list8)
//
////let list = Q100.mergeInBetween(list6, 2, 5, list9)
//let list = Q100.reverseList(list6)
//var listnode = list
//while listnode != nil {
//    print(listnode?.val as Any)
//    listnode = listnode?.next
//}
//

var stringA: [Character] = ["H","a","N","n","A","h"]
Q100.reverseString(&stringA)
print(stringA)

let stones = [2,7,4,1,8,1]
print(Q100.lastStoneWeight(stones))



let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2)
let treeNode3 = TreeNode(7)
let treeNode4 = TreeNode(8)
let treeNode5 = TreeNode(4, treeNode1, treeNode2)
let treeNode7 = TreeNode(6, treeNode3, treeNode4)
let treeNode8 = TreeNode(5, treeNode5, treeNode7)
// 前序
print(Q100.treeOrderFunc1(treeNode8))
print(Q100.treeOrderFunc11(treeNode8))
// 中序
print(Q100.treeOrderFunc2(treeNode8))
print(Q100.treeOrderFunc22(treeNode8))
// 后序
print(Q100.treeOrderFunc3(treeNode8))
print(Q100.treeOrderFunc33(treeNode8))

*/

/*
print(Q100.isAnagram("anagram", "nagaram"))

print(Q100.intersection([1, 2], [2, 1]))

print(Q100.sortArrayByParityII([4, 2, 5, 7]))

print("-*-*-*-*-*-*-*-*-*-*-*-*")

print(Q100.eraseOverlapIntervals([[1, 4], [2, 3], [3, 4]]))


print(Q100.binary_search([0, 1 ], 60))


print(Q100.fibFunc(5))

print(Q100.coinChange([2147483647] ,2))


print(Q100.solveNQueens(4))
print(Q100.largeGroupPositions("aaa"))

print("-*-*-*-*-*-*-*-*-*-*-*-*")

let treeNode1 = TreeNode(7)
let treeNode2 = TreeNode(15)
let treeNode3 = TreeNode(9)
let treeNode4 = TreeNode(20, treeNode2, treeNode1)
let treeNode5 = TreeNode(3, treeNode3, treeNode4)
//print(Q100.minDepth(treeNode5))


//print("-*-*-*-*-*-*-*-*-*-*-*-*--")
print(Q100.openLock(["0201","0101","0102","1212","2002"], "0202"))
print("-*-*-*-*-*-*-*-*-*-*-*-*--")

var arr = [1, 2]
Q100.rotate(&arr, 3)
print(arr)


print(Q100.trailingZeroes(5))

print((Q100.longestStr("abbbbbbbbbbbcdddddd")))

print(Q100.prefixesDivBy5([0, 1, 1, 1, 1, 1]))

print("-*-*-*-*-*-*-*-*-*-*-*-*--")
//let treeNode1 = TreeNode(5)
//let treeNode2 = TreeNode(4)
//let treeNode3 = TreeNode(3, treeNode1, nil)
//let treeNode4 = TreeNode(2, treeNode2, nil)
//let treeNode5 = TreeNode(1, treeNode3, treeNode4)
print(Q100.maxDepth(treeNode5))
print(Q100.maxDepths(treeNode5))


print(Q100.minWindow("ab", "a"))
print(Q100.checkInclusion("ab", "eidbaooo"))
print("-*-*-*-*-*-*-*-*-*-*-*-*--")
print(Q100.findAnagrams("baa", "aa"))


*/

//print(Q100.firstUniqChars(""))


print("-*-*-*-*-*-*-*-*-*-*-*-*")
let sortNumber = 100
let sortRange = UInt32(sortNumber)

var array = [Int]()
while array.count < 3 {
    array.append(Int(arc4random() % sortRange))
}

print(array)
//Order.BubbleSort1(&array)
Order.BubbleSort2(&array)
//
//Order.SelectSort(&array)
//
//Order.InsertSort(&array)
//
//Order.HeapSort(&array)
print(array)
print(Order.mergeMethod(array))

//print(Order.QuickSort(array: array))
print(Order.quick(array))


//let node6 = ListNode(4, nil)

//let node5 = ListNode(3, node6)
//let node4 = ListNode(1, node5)

//let node3 = ListNode(3)
//let node2 = ListNode(2, node3)
//let node1 = ListNode(1, node2)
////_ = Algorithm.mergeTwoLists(node1, node4)
//var node = Algorithm.swapPairs(node1)
//while node != nil {
//    print(node?.val as Any)
//    node = node?.next
//}
//

print(Q100.maximumProduct([-100,-2,-3,1]))

print(Q100.exchange([2, 2]))
print("-*-*-*-*-*-*-*-*-*-*-*-*")
print(Q100.addToArrayForms([2, 1, 5], 806))

print(Q100.numEquivDominoPairs([[1,2],[2,1],[3,4],[5,6]]))

print(Q100.singleNumbers([6, 2, 3, 3]))

let nums = [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
  ]
print(Q100.findNumberIn2DArray(nums, 20))

print(Q100.pivotIndex([1, 2, 3, 4, 6]))


////let treeNode1 = TreeNode(5)
//let treeNode2 = TreeNode(4)
//let treeNode3 = TreeNode(2, nil, nil)
//let treeNode4 = TreeNode(1, nil, treeNode3)
//let treeNode5 = TreeNode(3, treeNode4, treeNode2)
print("-*-*-*-*-*-*-*-*-*-*-*-*")
//print(Q100.kthLargest(treeNode5, 1))

print(Q100.fairCandySwap([1, 2], [2, 3]))
print(Q100.numWays(2))
print("-*-*-*-*-*-*-*-*-*-*-*-*")

print(Q100.characterReplacement("ABABCC", 2))


print(Q100.medianSlidingWindow([1,3,-1,-3,5,3,6,7], 3))

print(Q100.findMaxAverage([1,12,-5,-6,50,3], 4))

print(Q100.checkPossibility([3, 4, 2, 3]))


print(Q100.isToeplitzMatrix([[36,59,71,15,26,82,87],[56,36,59,71,15,26,82],[15,0,36,59,71,15,26]]))

//print(Q100.averageOfLevels(treeNode5))

let customers = [1,0,1,2,1,1,7,5]
let grumpy = [0,1,0,1,0,1,0,1]
let X = 3
print(Q100.maxSatisfied(customers, grumpy, X))
print("-*-*-*-*-*-*-*-*-*-*-*-*")
_ = Q100.flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])

let node10 = TreeNode(2)
let node9 = TreeNode(6)
let node8 = TreeNode(9, nil, node10)
let node7 = TreeNode(7, node9, nil)
let node6 = TreeNode(8)
let node5 = TreeNode(12)
let node4 = TreeNode(3, node5, node6)
let node3 = TreeNode(4, node7, node8)
let node2 = TreeNode(10, node4, nil)
let node1 = TreeNode(1, node2, node3)
print(Q100.isEvenOddTree(node1))

_ = Q100.constructMaximumBinaryTree([3,2,1,6,0,5])

print(Q100.hammingWeight(00000000000000000000000000001011))
