//
//  337 House Robber III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/house-robber-iii/
class Solution {

    /// Determines the maximum amount of money the thief can rob tonight without
    /// alerting the police.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The maximum amount of money the thief can rob.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func rob(_ root: TreeNode?) -> Int {
        let ans = dfs(root)
        return max(ans.0, ans.1)
    }

    private func dfs(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else { return (0, 0) }

        let left = dfs(root.left)
        let right = dfs(root.right)

        let rob = root.val + left.1 + right.1
        let notRob = max(left.0, left.1) + max(right.0, right.1)

        return (rob, notRob)
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
