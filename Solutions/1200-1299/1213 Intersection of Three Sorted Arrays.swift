//
//  1213 Intersection of Three Sorted Arrays.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/intersection-of-three-sorted-arrays/
class Solution {

    /// Finds a sorted array of only the integers that appeared in all three given
    /// arrays.
    ///
    /// - Parameters:
    ///   - arr1: An array of integers.
    ///   - arr2: An array of integers.
    ///   - arr3: An array of integers.
    /// - Returns: Sorted array of only the integers that appeared in all three
    /// given arrays.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the total length of all the input arrays.
    ///   - space: O(m), where m is the number of integers that appeared in all
    ///   three arrays.
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var ans = [Int]()
        var p1 = 0
        var p2 = 0
        var p3 = 0
        
        while p1 < arr1.count, p2 < arr2.count, p3 < arr3.count {
            if arr1[p1] == arr2[p2], arr2[p2] == arr3[p3] {
                ans.append(arr1[p1])
                p1 += 1
                p2 += 1
                p3 += 1
            } else if arr1[p1] < arr2[p2] {
                p1 += 1
            } else if arr2[p2] < arr3[p3] {
                p2 += 1
            } else {
                p3 += 1
            }
        }
        
        return ans
    }

}
