//
//  436 Find Right Interval.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-right-interval/
class Solution {

    /// Checks if there exists an interval j whose start point is bigger than or equal to
    /// the end point of the interval i.
    ///
    /// - Parameter intervals: The intervals.
    /// - Returns: An array of intervals indexes.
    ///
    /// - Complexity:
    ///   - time: O(n log(n)), where n is the number of intervals.
    ///   - space: O(n), where n is the number of intervals.
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        guard !intervals.isEmpty else { return [] }
        guard intervals.count > 1 else { return [-1] }

        var dict = [Int: Int]()
        var sp = [Int]()
        for (i, el) in intervals.enumerated() {
            dict[el[0]] = i
            sp.append(el[0])
        }
        sp.sort()

        var ans = [Int]()
        for interval in intervals {
            var start = 0
            var end = intervals.count - 1
            var min = -1
            var found = false
            while start <= end {
                let mid = start + (end - start) / 2
                if sp[mid] >= interval[1] {
                    min = sp[mid]
                    end = mid - 1
                    found = true
                } else {
                    start = mid + 1
                }
            }

            ans.append(found ? (dict[min] ?? -1) : -1)
        }

        return ans
    }

}
