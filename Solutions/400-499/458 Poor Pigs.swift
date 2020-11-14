//
//  458 Poor Pigs.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/poor-pigs/
class Solution {

    /// Finds how many pigs you need to figure out the poisonous bucket within `p` minutes.
    ///
    /// - Parameters:
    ///   - buckets: The number of buckets.
    ///   - minutesToDie: The number of minutes for a pig to die.
    ///   - minutesToTest: The number of minutes for test.
    /// - Returns: The number of pigs.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let states = minutesToTest / minutesToDie + 1
        return Int(ceil(log(Double(buckets)) / log(Double(states))))
    }

}
