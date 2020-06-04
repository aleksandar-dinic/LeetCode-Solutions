//
//  344 Reverse String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/reverse-string/
class Solution {

    /// Reverses a string in-place.
    ///
    /// - Parameter s: An array of characters.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the *s*.
    ///   - space: O(1), only constant space is used.
    func reverseString(_ s: inout [Character]) {
        var i = 0
        var j = s.count-1

        while i < j {
            s.swapAt(i, j)

            i += 1
            j -= 1
        }
    }

}
