//
//  339 Nested List Weight Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/nested-list-weight-sum/
class Solution {

    /// Finds the sum of all integers in the list weighted by their depth.
    ///
    /// - Parameter nestedList: A nested list of integers.
    /// - Returns: The sum.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of integers in the `nestedList`.
    ///   - space: O(n), where n is the number of integers in the `nestedList`.
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        depthSum(nestedList, 1)
    }
    
    private func depthSum(_ nestedList: [NestedInteger], _ depth: Int) -> Int {
        var ans = 0
        
        for nested in nestedList {
            if nested.isInteger() {
                ans += depth * nested.getInteger()
            } else {
                ans += depthSum(nested.getList(), depth + 1)
            }
        }
        
        return ans
    }

}

/// Provided code
class NestedInteger {
    
    /// Returns true if holds a single integer, otherwise returns false.
    public func isInteger() -> Bool

    /// Returns the single integer.
    public func getInteger() -> Int

    /// Set a single integer.
    public func setInteger(value: Int)

    /// Set a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger)
    
    /// Returns the nested list.
    public func getList() -> [NestedInteger]

}
