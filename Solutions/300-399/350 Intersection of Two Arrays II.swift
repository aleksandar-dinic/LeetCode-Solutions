//
//  350 Intersection of Two Arrays II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/intersection-of-two-arrays-ii/
class Solution {

    /// Computes intersections of two arrays.
    ///
    /// - Parameters:
    ///   - nums1: An array.
    ///   - nums2: An array.
    /// - Returns: Intersection of two arrays.
    ///
    /// - Complexity:
    ///     - time: O(max(n, m)), where n is length of `nums1`, and m is the length
    ///     of `nums2`.
    ///     - space: O(n), where n is length of `nums1`.
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic = [Int: Int]()
        
        for num in nums1 {
            dic[num, default: 0] += 1
        }
        
        var ans = [Int]()
        
        for num in nums2 {
            guard let val = dic[num], val > 0 else { continue }
            ans.append(num)
            dic[num] = val - 1
        }
        
        return ans
    }
    
}
