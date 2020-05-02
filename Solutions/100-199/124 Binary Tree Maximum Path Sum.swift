//
//  124 Binary Tree Maximum Path Sum.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-maximum-path-sum/
class Solution {

    /// Finds the maximum path sum in binary tree.
    ///
    /// - Parameter root: Binary tree root.
    ///
    /// - Returns: The maximum path sum.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in binary tree.
    ///   - space: O(n), where n is the number of nodes in binary tree.
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var currMaxSum = Int.min
        return max(maxPathSum(root, currMaxSum: &currMaxSum), currMaxSum)
    }

    private func maxPathSum(_ currNode: TreeNode?, currMaxSum: inout Int) -> Int {
        guard let currNode = currNode else { return 0 }

        let leftSum = max(maxPathSum(currNode.left, currMaxSum: &currMaxSum), 0)
        let rightSum = max(maxPathSum(currNode.right, currMaxSum: &currMaxSum), 0)

        currMaxSum = max(currNode.val + leftSum + rightSum, currMaxSum)
        return max(leftSum, rightSum) + currNode.val
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
