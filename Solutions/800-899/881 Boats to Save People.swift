//
//  881 Boats to Save People.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/boats-to-save-people/
class Solution {

    /// Finds the minimum number of boats to carry every given person.
    ///
    /// - Parameters:
    ///   - people: The people's weight.
    ///   - limit: A maximum weight each boat can carry.
    /// - Returns: The minimum number of boats.
    ///
    /// - Complexity:
    ///     - time: O(n log(n)), where n is the number of people.
    ///     - space: O(n), where n is the number of people.
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var people = people.sorted()
        var ans = 0
        var i = 0
        var j = people.count - 1
        
        while i <= j {
            if people[i] + people[j] <= limit {
                i += 1
            }
            j -= 1
            
            ans += 1
        }
        
        return ans
    }

}
