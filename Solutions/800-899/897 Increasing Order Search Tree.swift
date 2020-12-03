//
//  897 Increasing Order Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/increasing-order-search-tree/
class Solution {

    private var cur = TreeNode(-1)

    /// Rearranges the tree in in-order so that the leftmost node in the tree is now
    /// the root of the tree, and every node has no left child and only one right
    /// child.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The new root of the binary tree.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the binary tree.
    ///     - space: O(n), where n is the number of nodes in the binary tree.
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var ans = TreeNode(-1)
        cur = ans
        inorder(root)
        return ans.right
    }

    private func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        inorder(node.left)
        node.left = nil
        cur.right = node
        cur = node
        inorder(node.right)
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
