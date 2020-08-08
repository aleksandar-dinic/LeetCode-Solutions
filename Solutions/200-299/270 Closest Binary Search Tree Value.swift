//
//  270 Closest Binary Search Tree Value.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/closest-binary-search-tree-value/
class Solution {

    /// Finds the value in the BST that is closest to the target.
    ///
    /// - Parameters:
    ///   - root: Binary search tree root.
    ///   - target: The target.
    /// - Returns: The value that is closest to the target.
    ///
    /// - Complexity:
    ///   - time: O(h), where h is the height of the binary search tree.
    ///   - space: O(1), only constant space is used.
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else { return -1 }
        var curr: TreeNode? = root
        var closest = root.val
        var val = Int.max

        while curr != nil {
            val = curr?.val ?? Int.max
            closest = abs(Double(val) - target) < abs(Double(closest) - target) ? val : closest

            curr = target < Double(val) ? curr?.left : curr?.right
        }

        return closest
    }

}

/// Provided code
public class TreeNode {

    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }

    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

}
