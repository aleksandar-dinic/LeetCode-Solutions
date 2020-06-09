//
//  151 Reverse Words in a String.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/reverse-words-in-a-string/
class Solution {

    /// Reverses the string word by word.
    ///
    /// - Parameter s: An input string.
    /// - Returns: Reversed string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of words in the input string.
    ///   - space: O(m), where m is the length of the input string.
    func reverseWords(_ s: String) -> String {
        var ans = s.split(separator: " ")

        var start = 0
        var end = ans.count - 1

        while start < end {
            ans.swapAt(start, end)
            start += 1
            end -= 1
        }

        return ans.joined(separator: " ")
    }

}
