//
//  760 Find Anagram Mappings.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-anagram-mappings/
class Solution {

    /// Finds an index mapping.
    ///
    /// - Parameters:
    ///   - A: An array of integers.
    ///   - B: An array of integers.
    /// - Returns: The mapped indexes.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the length of `A` and `B`.
    ///     - space: O(n), where n is the length of `A` and `B`.
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        var dict = [Int: Int]()
        
        for (i, b) in B.enumerated() {
            dict[b] = i
        }
        
        var ans = [Int]()
        
        for a in A {
            guard let val = dict[a] else { continue }
            ans.append(val)
        }
        
        return ans
    }

}
