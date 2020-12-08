//
//  1010 Pairs of Songs With Total Durations Divisible by 60.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
class Solution {

    /// Finds the number of pairs of songs for which their total duration in seconds
    /// is divisible by 60.
    ///
    /// - Parameter time: A list of song duration.
    /// - Returns: The number of pairs of songs.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `time`.
    ///   - space: O(n), where n is the length of `time`.
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var ans = 0
        var dict = [Int: Int]()
        
        for t in time {
            if t % 60 == 0 {
                ans += dict[0] ?? 0
            } else if let val = dict[60 - t % 60] {
                ans += val
            }
            
            dict[t % 60, default: 0] += 1
        }
        
        return ans
    }

}
