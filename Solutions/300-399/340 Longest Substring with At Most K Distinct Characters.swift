//
//  340 Longest Substring with At Most K Distinct Characters.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/
class Solution {

    /// Finds the length of the longest substring of `s` that contains at most `k`
    /// distinct characters.
    ///
    /// - Parameters:
    ///   - s: A string.
    ///   - k: An integer.
    /// - Returns: The length of the longest substring.
    ///
    /// - Complexity:
    ///   - time: O(n * k), where n is the length of `s`, and k is the given `k`.
    ///   - space: O(n), where n is the length of `s`.
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        let n = s.count
        guard n * k > 0 else { return 0 }
        
        var start = 0
        var end = 0
        
        var dict = [Character: Int]()
        var ans = 1
        
        while end < n {
            dict[s[end]] = end
            end += 1
            
            if dict.count == k + 1 {
                guard let lowestIndex = dict.values.min() else { continue }
                dict.removeValue(forKey: s[lowestIndex])
                start = lowestIndex + 1
            }
            
            ans = max(ans, end - start)
        }
        
        return ans
    }

}
