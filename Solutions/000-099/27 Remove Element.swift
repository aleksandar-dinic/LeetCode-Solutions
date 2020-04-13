//
//  27 Remove Element.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/remove-element/
class Solution {

    /// Removes all instances of the value in-place.
    ///
    /// - Parameters:
    ///   - nums: Array of numbers
    ///   - val: The value to be removed
    ///
    /// - Returns: New length of array
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the nums.
    ///   - space: O(1), only constant space is used.
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else { return 0 }

        var i = 0

        for num in nums {
            guard num != val else { continue }

            nums[i] = num
            i += 1
        }

        return i
    }

}
