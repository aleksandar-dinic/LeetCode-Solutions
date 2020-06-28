//
//  349 Intersection of Two Arrays.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 28/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/intersection-of-two-arrays/
class Solution {

    /// Computes the intersection of two arrays.
    ///
    /// - Parameters:
    ///   - nums1: An array of integers.
    ///   - nums2: An array of integers.
    /// - Returns: Intersection of two arrays.
    ///
    /// - Complexity:
    ///   - time: O(max(n, m)), where n is the length of the nums1, and m is the length of
    ///     the nums2.
    ///   - space: O(max(n, m)), where n is the length of the nums1, and m is the length of
    ///     the nums2.
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var buf = Set<Int>()

        for num in nums1 {
            buf.insert(num)
        }

        var ans = Set<Int>()

        for num in nums2 {
            guard buf.contains(num), !ans.contains(num) else { continue }
            ans.insert(num)
        }

        return Array(ans)
    }

}
