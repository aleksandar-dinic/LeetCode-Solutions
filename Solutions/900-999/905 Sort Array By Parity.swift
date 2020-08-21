//
//  905 Sort Array By Parity.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sort-array-by-parity/
class Solution {

    /// Returns an array consisting of all the even elements of A, followed by all the odd
    /// elements of A.
    ///
    /// - Parameter A: The array.
    /// - Returns: All the even elements of A, followed by all the odd elements of A.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of A.
    ///     - space: O(n), where n is the length of A.
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var ans = A

        var i = 0
        var j = ans.count - 1

        while i < j {
            if ans[i] % 2 > ans[j] % 2 {
                ans.swapAt(i, j)
            }

            if ans[i] % 2 == 0 {
                i += 1
            }

            if ans[j] % 2 == 1 {
                j -= 1
            }
        }

        return ans
    }

}
