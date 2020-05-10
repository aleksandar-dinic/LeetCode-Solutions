//
//  997 Find the Town Judge.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-the-town-judge/
class Solution {

    /// Finds the Town Judge
    ///
    /// - Parameters:
    ///   - N: Number of people in the Town.
    ///   - trust: An array of pairs trust[i] = [a, b] representing that the person
    ///     labelled a trusts the person labelled b.
    /// - Returns: The label of the town judge, otherwise returns -1.
    ///
    /// - Complexity:
    ///     - time: O(max(t, n)), where t is the length of the *trust*, and n is the *N*.
    ///     - space: O(n), where n is the *N*.
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var people = [Int](repeating: 0, count: N)

        for t in trust {
            people[t[0]-1] -= 1
            people[t[1]-1] += 1
        }

        for i in 1...N {
            guard people[i-1] == N-1 else { continue }
            return i
        }

        return -1
    }

}
