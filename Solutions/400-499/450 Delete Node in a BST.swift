//
//  450 Delete Node in a BST.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 31/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/delete-node-in-a-bst/
class Solution {

    /// Deletes the node with the given key.
    ///
    /// - Parameters:
    ///   - root: Binary tree root.
    ///   - key: Key for a node to remove.
    /// - Returns: Binary tree root.
    ///
    /// - Complexity:
    ///   - time: O(log(n)), where n is the number of nodes in the tree.
    ///   - space: O(h), where h is a tree height.
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val == key {
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            }

            let minVal = findMin(root.right)
            root.val = minVal
            root.right = deleteNode(root.right, root.val)

        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
        }

        return root
    }

    private func findMin(_ node: TreeNode?) -> Int {
        guard var node = node else { return -1 }

        while let left = node.left {
            node = left
        }
        return node.val
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
