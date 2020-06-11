//
//  75 Sort Colors.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundations

/// Source: https://leetcode.com/problems/sort-colors/
class Solution {

    /// Sorts colors in-place.
    ///
    /// - Parameter nums: An array with red, white or blue color. The integers 0, 1, and 2
    ///   represent the color red, white, and blue respectively.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func sortColors(_ nums: inout [Int]) {
        var zeroIndex = 0
        var twoIndex = nums.count - 1
        var i = 0

        while i <= twoIndex {
            if nums[i] == 0, i > zeroIndex {
                nums.swapAt(i, zeroIndex)
                zeroIndex += 1

            } else if nums[i] == 2, i < twoIndex {
                nums.swapAt(i, twoIndex)
                twoIndex -= 1

            } else {
                i += 1
            }
        }
    }

}
