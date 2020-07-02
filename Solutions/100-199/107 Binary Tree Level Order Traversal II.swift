//
//  107 Binary Tree Level Order Traversal II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
class Solution {

    /// Returns the bottom-up level order traversal of binary tree nodes' values.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The bottom-up level order traversal of nodes' values.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var ans = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            ans.insert(level, at: 0)
        }

        return ans
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
