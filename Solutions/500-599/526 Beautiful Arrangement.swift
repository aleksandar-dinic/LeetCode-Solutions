//
//  526 Beautiful Arrangement.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/beautiful-arrangement/
class Solution {

    private var ans = 0
    
    /// Finds the number of beautiful arrangements that you can construct.
    ///
    /// - Parameter n: An integer.
    /// - Returns: The number of beautiful arrangements.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the number of valid permutations.
    ///   - space: O(n), where n is the given `n`.
    func countArrangement(_ n: Int) -> Int {
        var visited = [Bool](repeating: false, count: n + 1)
        calculate(n, 1, &visited)
        return ans
    }
    
    private func calculate(_ n: Int, _ position: Int, _ visited: inout [Bool]) {
        if position > n {
            ans += 1
        }
        
        for i in 1...n {
            guard !visited[i], (position % i == 0 || i % position == 0) else { continue }
            visited[i] = true
            calculate(n, position + 1, &visited)
            visited[i] = false
        }
    }

}
