//
//  771 Jewels and Stones.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source:  https://leetcode.com/problems/jewels-and-stones
class Solution {

    /// Return how many of your stones are also jewels.
    ///
    /// - Parameters:
    ///   - J: Representing the types of stones that are jewels.
    ///   - S: Representing the stones you have.
    ///
    /// - Returns: How many of your stones are jewels.
    ///
    /// - Complexity:
    ///     - time: O(j + s), where j is the length of the J, and s is the length of the S.
    ///     - space: O(j), where j is the length of the J.
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var jewels = Set<Character>()
        for jewel in J {
            jewels.insert(jewel)
        }

        var ans = 0
        for stone in S {
            guard jewels.contains(stone) else { continue }
            ans += 1
        }

        return ans
    }

}
