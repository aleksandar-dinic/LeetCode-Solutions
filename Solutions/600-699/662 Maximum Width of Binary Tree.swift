//
//  662 Maximum Width of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/maximum-width-of-binary-tree/
class Solution {

    /// Calculates the maximum width of a binary tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The maximum width of the given tree.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var queue = [(TreeNode, Int)]()
        queue.append((root, 0))

        var ans = 1

        while !queue.isEmpty {
            let count = queue.count
            let firstNode = queue.first!
            let lastNode = queue.last!

            ans = max(ans, lastNode.1 - firstNode.1 + 1)

            for _ in 0..<count {
                let (node, val) = queue.removeFirst()
                if let leftNode = node.left {
                    queue.append((leftNode, val * 2 - 1))
                }
                if let rightNode = node.right {
                    queue.append((rightNode, val * 2))
                }
            }
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
