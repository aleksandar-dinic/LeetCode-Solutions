//
//  31 Next Permutation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 31/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/next-permutation/
class Solution {

    /// Rearranges numbers into the lexicographically next greater permutation of
    /// numbers.
    ///
    /// - Parameter nums: An array of numbers.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `nums`.
    ///   - space: O(1), only constant space is used.
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        var i = n - 2
        while i >= 0, nums[i + 1] <= nums[i] {
            i -= 1
        }
        
        guard i >= 0 else {
            reverse(&nums, start: i + 1, end: n - 1)
            return
        }
        
        var j = n - 1
        while j >= 0, nums[j] <= nums[i] {
            j -= 1
        }
        nums.swapAt(i, j)
        reverse(&nums, start: i + 1, end: n - 1)
    }
    
    private func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var i = start
        var j = end
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

}
