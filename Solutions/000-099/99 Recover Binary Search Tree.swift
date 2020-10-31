//
//  99 Recover Binary Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 31/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/recover-binary-search-tree/
class Solution {

    private var first: TreeNode?
    private var second: TreeNode?
    private var prev = TreeNode(Int.min)

    /// Recovers the tree without changing its structure where exactly two nodes of
    /// the tree were swapped by mistake.
    ///
    /// - Parameter root: Binary tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(h), where h is the height of the binary tree.
    func recoverTree(_ root: TreeNode?) {
        traverse(root)

        guard let first = first, let second = second else { return }

        let tmp = first.val
        first.val = second.val
        second.val = tmp
    }

    private func traverse(_ root: TreeNode?) {
        guard let root = root else { return }
        traverse(root.left)

        if first == nil, prev.val >= root.val {
            first = prev
        }

        if first != nil, prev.val >= root.val {
            second = root
        }

        prev = root

        traverse(root.right)
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
