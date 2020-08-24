//
//  404 Sum of Left Leaves.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sum-of-left-leaves/
class Solution {

    /// Finds the sum of all left leaves in a given binary tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The sum of all left leaves.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return dfs(root, false)
    }

    private func dfs(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        guard let root = root else { return 0 }

        guard root.left != nil || root.right != nil || !isLeft else {
            return root.val
        }

        return dfs(root.left, true) + dfs(root.right, false)
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
