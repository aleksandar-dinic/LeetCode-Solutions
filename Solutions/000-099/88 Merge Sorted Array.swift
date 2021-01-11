//
//  88 Merge Sorted Array.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/merge-sorted-array/
class Solution {

    /// Merge `nums2` into `nums1` as one sorted array.
    ///
    /// - Parameters:
    ///   - nums1: The sorted integer array.
    ///   - m: The number of elements in `nums1`.
    ///   - nums2: The sorted integer array.
    ///   - n: The number of elements in `nums2`.
    ///
    /// - Complexity:
    ///   - time: O(m + n), where m is the number of elements in `nums1`, and n is
    ///     the number of elements in `nums2`.
    ///   - space: O(1), only constant space is used.
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var lastA = m - 1
        var lastB = n - 1
        var curr = nums1.count - 1

        while lastA >= 0, lastB >= 0 {
            if nums1[lastA] >= nums2[lastB] {
                nums1[curr] = nums1[lastA]
                lastA -= 1
            } else {
                nums1[curr] = nums2[lastB]
                lastB -= 1
            }

            curr -= 1
        }

        while lastB >= 0 {
            nums1[curr] = nums2[lastB]
            lastB -= 1
            curr -= 1
        }
    }

}
