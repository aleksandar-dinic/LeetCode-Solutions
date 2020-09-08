//
//  1022 Sum of Root To Leaf Binary Numbers.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
class Solution {

    /// Calculates the sum where the numbers are represented by the path from the root to
    /// the leaf.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The sum.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var ans = 0
        dfs(root, root.val, &ans)
        return ans
    }

    private func dfs(_ root: TreeNode, _ currNumber: Int, _ ans: inout Int) {
        if root.left == nil, root.right == nil {
            ans += currNumber
            return
        }

        if let left = root.left {
            dfs(left, (currNumber * 2) + left.val, &ans)
        }

        if let right = root.right {
            dfs(right, (currNumber * 2) + right.val, &ans)
        }
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
