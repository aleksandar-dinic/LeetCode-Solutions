//
//  702 Search in a Sorted Array of Unknown Size.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/
class Solution {

    /// Searches for target index in an array with unknown size.
    ///
    /// - Parameters:
    ///   - reader: The ArrayReader.
    ///   - target: The target number.
    /// - Returns: Target's index if exists, otherwise returns -1.
    ///
    /// - Complexity:
    ///     - time: O(log (n)), where n is the length of the array.
    ///     - space: O(1), only constant space is used.
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var left = 0
        var right = 1

        while reader.get(right) < target {
            left = right
            right *= 2
        }

        while left <= right {
            let mid = left + (right - left) / 2

            let num = reader.get(mid)
            guard num != target else { return mid }

            if num < target {
                left = mid + 1
            } else {
                right = mid - 1
            }

        }

        return -1
    }

}

/// Provided Code
public class ArrayReader {

    public func get(_ index: Int) -> Int {}

}
