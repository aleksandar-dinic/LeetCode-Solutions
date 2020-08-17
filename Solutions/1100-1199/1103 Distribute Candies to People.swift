//
//  1103 Distribute Candies to People.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/distribute-candies-to-people/
class Solution {

    /// Calculates the distribution of the candies.
    ///
    /// - Parameters:
    ///   - candies: The number of candies.
    ///   - num_people: The number of people.
    /// - Returns: The final distribution of candies.
    ///
    /// - Complexity:
    ///   - time: O(sqrt(n)), where n is the number of candies.
    ///   - space: O(m), where m is the number of people.
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: num_people)

        var candies = candies
        var curr = 0

        while candies > 0 {
            ans[curr % num_people] += min(candies, curr + 1)
            curr += 1
            candies -= curr
        }

        return ans
    }

}
