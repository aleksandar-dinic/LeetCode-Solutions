//
//  700 Search in a Binary Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source:  https://leetcode.com/problems/search-in-a-binary-search-tree/
class Solution {

    /// Finds the node in the BST that the node's value equals the given value.
    ///
    /// - Parameters:
    ///   - root: The root node of a binary search tree (BST).
    ///   - val: The value to search.
    /// - Returns: The subtree rooted with the node. If such node doesn't exist, returns nil.
    ///
    /// - Complexity:
    ///     - time: O(log n), where n is the number of nodes.
    ///     - space: O(1), only constant space is used.
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }

        guard root.val != val else { return root }

        if root.val < val {
            return searchBST(root.right, val)
        }

        return searchBST(root.left, val)
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
