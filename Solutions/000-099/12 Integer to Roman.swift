//
//  12 Integer to Roman.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/integer-to-roman/
class Solution {

    /// Converts an integer to a roman numeral.
    ///
    /// - Parameter num: The integer.
    /// - Returns: Roman numeral.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of digits in num.
    ///   - space: O(1), only constant space is used.
    func intToRoman(_ num: Int) -> String {
        let roman = [
            ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
            ["", "M", "MM", "MMM"]
        ]

        var ans = ""
        var digit = 0
        var num = num

        while num > 0 {
            let remain = num % 10
            ans = "\(roman[digit][remain])\(ans)"
            digit += 1
            num /= 10
        }

        return ans
    }

}
