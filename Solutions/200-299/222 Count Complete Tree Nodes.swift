//
//  222 Count Complete Tree Nodes.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/count-complete-tree-nodes/
class Solution {

    /// Counts the number of nodes in a complete binary tree.
    ///
    /// - Parameter root: The complete binary tree.
    /// - Returns: Number of nodes.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return countNodes(root.left) + countNodes(root.right) + 1
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
