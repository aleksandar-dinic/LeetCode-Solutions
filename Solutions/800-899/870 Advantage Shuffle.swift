//
//  870 Advantage Shuffle.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/advantage-shuffle/
class Solution {

    /// Finds any permutation of `A` that maximizes its advantage with respect to `B`.
    ///
    /// - Parameters:
    ///   - A: An array.
    ///   - B: An array.
    /// - Returns: Advantage shuffle.
    ///
    /// - Complexity:
    ///     - time: O(n log n), where n is the length of `A` and `B`.
    ///     - space: O(n), where n is the length of `A` and `B`.
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        let sortedA = A.sorted()
        let sortedB = B.sorted()
        
        var assigned = [Int: [Int]]()
        for b in B {
            assigned[b] = [Int]()
        }
        
        var remaining = [Int]()
        var j = 0
        for a in sortedA {
            if a > sortedB[j] {
                assigned[sortedB[j]]?.append(a)
                j += 1
            } else {
                remaining.append(a)
            }
        }
        
        let n = B.count
        var ans = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            if assigned[B[i]]?.isEmpty ?? true {
                ans[i] = remaining.removeLast()
            } else {
                ans[i] = assigned[B[i]]?.removeLast() ?? -1
            }
        }
        
        return ans
    }

}
