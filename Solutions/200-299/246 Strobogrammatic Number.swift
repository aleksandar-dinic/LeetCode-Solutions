//
//  246 Strobogrammatic Number.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/strobogrammatic-number/
class Solution {

    /// Determines if a number is strobogrammatic.
    ///
    /// - Parameter num: The number, represented as a string.
    /// - Returns: True if the number is strobogrammatic, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the number.
    ///   - space: O(1), only constant space is used.
    func isStrobogrammatic(_ num: String) -> Bool {
        let dict: [Character: Character] = [
            "0": "0",
            "1": "1",
            "6": "9",
            "8": "8",
            "9": "6"
        ]
        let num = Array(num)

        var i = 0
        var j = num.count - 1

        while i <= j {
            guard dict[num[i]] == num[j] else { return false }
            i += 1
            j -= 1
        }

        return true
    }

}
