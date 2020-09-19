//
//  1291 Sequential Digits.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sequential-digits/
class Solution {

    private let seq = Sequential()

    /// Finds a sorted list of integers in the range, including only those that have
    /// sequential digits.
    ///
    /// - Parameters:
    ///   - low: Lower bound.
    ///   - high: Upper bound.
    /// - Returns: The sorted list of integers in the range.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var ans = [Int]()

        for num in seq.nums {
            guard num >= low, num <= high else { continue }
            ans.append(num)
        }

        return ans
    }

}

final class Sequential {

    var nums = [Int]()

    init() {
        let sample: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let n = 10

        for length in 2..<n {
            for start in 0..<(n - length) {
                let n = sample[start..<(start + length)]
                guard let num = Int(String(n)) else { continue }
                nums.append(num)
            }
        }
    }

}
