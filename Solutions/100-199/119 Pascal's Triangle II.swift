//
//  119 Pascal's Triangle II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/pascals-triangle-ii/
class Solution {

    /// Finds the k-th index row of the Pascal's triangle.
    ///
    /// - Parameter rowIndex: Non-negative index k.
    ///
    /// - Returns: K-th index row of the Pascal's triangle.
    ///
    /// - Complexity:
    ///   - time: O(k), where k is the rowIndex.
    ///   - space: O(k), where k is the rowIndex.
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        
        var ans = [Int]()
        ans.append(1)

        var tmp = 1
        for i in 1...rowIndex {
            tmp = tmp * (rowIndex + 1 - i) / i
            ans.append(tmp)
        }

        return ans
    }

}
