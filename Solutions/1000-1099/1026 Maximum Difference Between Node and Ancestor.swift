//
//  1026 Maximum Difference Between Node and Ancestor.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
class Solution {

    /// Finds the maximum value `V` for which there exist different nodes `A` and `B`
    /// where `V = |A.val - B.val|` and `A` is an ancestor of `B`.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The maximum value `V`.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return dfs(root, curMax: root.val, curMin: root.val)
    }

    private func dfs(_ root: TreeNode?, curMax: Int, curMin: Int) -> Int {
        guard let root = root else { return curMax - curMin }

        let curMax = max(curMax, root.val)
        let curMin = min(curMin, root.val)

        let left = dfs(root.left, curMax: curMax, curMin: curMin)
        let right = dfs(root.right, curMax: curMax, curMin: curMin)

        return max(left, right)
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
