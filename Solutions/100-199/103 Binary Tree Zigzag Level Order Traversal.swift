//
//  103 Binary Tree Zigzag Level Order Traversal.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
class Solution {

    /// Returns the zigzag level order traversal of binary tree nodes' values.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The zigzag level order traversal.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        dfs(root, level: 0, ans: &ans)
        return ans
    }

    private func dfs(_ node: TreeNode?, level: Int, ans: inout [[Int]]) {
        guard let node = node else { return }
        if ans.count <= level {
            ans.append([Int]())
        }

        if level % 2 == 0 {
            ans[level].append(node.val)
        } else {
            ans[level].insert(node.val, at: 0)
        }

        dfs(node.left, level: level + 1, ans: &ans)
        dfs(node.right, level: level + 1, ans: &ans)
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
