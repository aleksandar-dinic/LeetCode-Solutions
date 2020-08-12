//
//  186 Reverse Words in a String II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/reverse-words-in-a-string-ii/
class Solution {

    /// Reverses the string word by word.
    ///
    /// - Parameter s: The string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the string.
    ///   - space: O(1), only constant space is used.
    func reverseWords(_ s: inout [Character]) {
        reverse(&s, start: 0, end: s.count - 1)

        var start = 0
        for end in 0..<s.count {
            guard s[end] == " " else { continue }

            reverse(&s, start: start, end: end - 1)
            start = end + 1
        }
        reverse(&s, start: start, end: s.count - 1)
    }

    private func reverse(_ s: inout [Character], start: Int, end: Int) {
        var start = start
        var end = end

        while start < end {
            s.swapAt(start, end)
            start += 1
            end -= 1
        }
    }

}
