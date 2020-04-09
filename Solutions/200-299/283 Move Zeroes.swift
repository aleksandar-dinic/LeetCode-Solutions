//
//  283 Move Zeroes.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source:  https://leetcode.com/problems/move-zeroes
class Solution {

    ///  Move all 0's to the end while maintaining the
    ///  relative order of the non-zero elements.
    ///
    /// - Parameter nums: Array of integers
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of the nums.
    ///     - space: O(1), only constant space is used.
    func moveZeroes(_ nums: inout [Int]) {
        guard !nums.isEmpty else { return }

        var j = 0
        for (i, num) in nums.enumerated() {
            guard num != 0 else { continue }
            nums.swapAt(i, j)
            j += 1
        }
    }

}
