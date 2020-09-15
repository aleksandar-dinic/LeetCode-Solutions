//
//  510 Inorder Successor in BST II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/09/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/inorder-successor-in-bst-ii/
class Solution {

    /// Finds the in-order successor of the given node in a binary search tree.
    ///
    /// - Parameter node: A node in the BST.
    /// - Returns: The in-order successor of the given node.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in BST.
    ///   - space: O(1), only constant space is used.
    func inorderSuccessor(_ node: Node?) -> Node? {
        var node = node

        if node?.right != nil {
            node = node?.right
            while node?.left != nil {
                node = node?.left
            }
            return node
        }

        while node?.parent != nil, node?.val == node?.parent?.right?.val {
            node = node?.parent
        }

        return node?.parent
    }

}

/// Provided code
public class Node {

    public var val: Int
    public var left: Node?
    public var right: Node?
    public var parent: Node?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }

}
