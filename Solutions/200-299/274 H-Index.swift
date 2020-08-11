//
//  274 H-Index.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/h-index/
class Solution {

    /// Computes the researcher's h-index.
    ///
    /// - Parameter citations: An array of citations of a researcher.
    /// - Returns: H-index.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of citations.
    ///   - space: O(n), where n is the length of citations.
    func hIndex(_ citations: [Int]) -> Int {
        guard !citations.isEmpty else { return 0 }
        let n = citations.count

        var papers = [Int](repeating: 0, count: n+1)
        for citation in citations {
            papers[min(n, citation)] += 1
        }

        var ans = 0

        for i in (0...n).reversed() {
            ans += papers[i]
            guard ans >= i else { continue }
            return i
        }

        return 0
    }

}
