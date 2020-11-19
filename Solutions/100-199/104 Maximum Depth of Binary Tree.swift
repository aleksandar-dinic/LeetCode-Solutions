//
//  104 Maximum Depth of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 19/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximum-depth-of-binary-tree/
class Solution {

    /// Finds the maximum depth in a binary tree.
    ///
    /// - Parameter root: The binary tree.
    /// - Returns: The maximum depth.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func maxDepth(_ root: TreeNode?) -> Int {
        root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
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
