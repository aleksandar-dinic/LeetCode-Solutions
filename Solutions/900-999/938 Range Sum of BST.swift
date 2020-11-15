//
//  938 Range Sum of BST.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/range-sum-of-bst/
class Solution {

    /// Finds the sum of values of all nodes with a value in the range `[low, high]`.
    ///
    /// - Parameters:
    ///   - root: Binary tree root.
    ///   - low: Lower range.
    ///   - high: Upper range.
    /// - Returns: The sum of values of all nodes with a value in the range.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the binary tree.
    ///     - space: O(n), where n is the number of nodes in the binary tree.
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }

        if root.val < low {
            return rangeSumBST(root.right, low, high)
        }

        if root.val > high {
            return rangeSumBST(root.left, low, high)
        }

        return root.val +
                rangeSumBST(root.left, low, high) +
                rangeSumBST(root.right, low, high)
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
