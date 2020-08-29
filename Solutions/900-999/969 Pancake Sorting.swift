//
//  969 Pancake Sorting.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/pancake-sorting/
class Solution {

    /// Sorts the array performing a series of pancake flips.
    ///
    /// - Parameter A: The array of integers.
    /// - Returns: Sorted array.
    ///
    /// - Complexity:
    ///     - time: O(n^2), where n is the length of the array of integers.
    ///     - space: O(n), where n is the length of the array of integers.
    func pancakeSort(_ A: [Int]) -> [Int] {
        var ans = [Int]()
        var nums = A

        for i in (1...nums.count).reversed() {
            var index = -1
            for j in 0..<nums.count {
                guard nums[j] == i else { continue }
                index = j
                break
            }

            guard index != i - 1 else { continue }

            if index != 0 {
                ans.append(index + 1)
                flip(&nums, index + 1)
            }

            ans.append(i)
            flip(&nums, i)
        }

        return ans
    }

    private func flip(_ nums: inout [Int], _ end: Int) {
        var start = 0
        var end = end - 1

        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }

}
