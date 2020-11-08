//
//  563 Binary Tree Tilt.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-tilt/
class Solution {

    private var totalTilt = 0

    /// Finds the sum of every tree node tilt.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The sum of every tree node tilt.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func findTilt(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return totalTilt
    }

    private func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let leftSum = dfs(root.left)
        let rightSum = dfs(root.right)
        totalTilt += abs(leftSum - rightSum)

        return leftSum + rightSum + root.val
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
