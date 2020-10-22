//
//  111 Minimum Depth of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-depth-of-binary-tree/
class Solution {

    /// Finds the minimum depth in a binary tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The minimum depth.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        guard root.left != nil || root.right != nil else { return 1 }

        var ans = Int.max
        if let left = root.left {
            ans = min(minDepth(left), ans)
        }
        if let right = root.right {
            ans = min(minDepth(right), ans)
        }

        return ans + 1
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
