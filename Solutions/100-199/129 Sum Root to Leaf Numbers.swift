//
//  129 Sum Root to Leaf Numbers.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 26/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/sum-root-to-leaf-numbers/
class Solution {

    /// Finds the total sum of all root-to-leaf numbers.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The total sum of all root-to-leaf numbers.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in binary tree.
    ///   - space: O(n), where n is the number of nodes in binary tree.
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return sumNumbers(root, sum: 0)
    }

    private func sumNumbers(_ root: TreeNode?, sum: Int) -> Int {
        guard let root = root else { return 0 }

        if root.left == nil, root.right == nil {
            return 10 * sum + root.val
        }

        return sumNumbers(root.left, sum: 10 * sum + root.val) + sumNumbers(root.right, sum: 10 * sum + root.val)
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
