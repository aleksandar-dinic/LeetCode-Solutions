//
//  100 Same Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/same-tree/
class Solution {

    /// Checks if two binary trees are the same.
    ///
    /// - Parameters:
    ///   - p: Binary tree root.
    ///   - q: Binary tree root.
    /// - Returns: True if p and q are the same, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(min(n, m)), where n is the number of nodes in p and m is the number of
    ///   nodes in q.
    ///   - space: O(min(n, m)), where n is the number of nodes in p and m is the number of
    ///   nodes in q.
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p != nil || q != nil else { return true }

        guard let p = p, let q = q else { return false }

        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }

}

/// Provided Code
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
