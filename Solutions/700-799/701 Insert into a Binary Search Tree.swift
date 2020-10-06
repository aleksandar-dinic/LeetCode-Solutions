//
//  701 Insert into a Binary Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/insert-into-a-binary-search-tree/
class Solution {

    /// Inserts new value in a Binary Search Tree (BST).
    ///
    /// - Parameters:
    ///   - root: The root node of the tree.
    ///   - val: A value to insert into the tree.
    /// - Returns: The root node of the tree after the insertion.
    ///
    /// - Complexity:
    ///     - time: O(h), where h is the height of the tree.
    ///     - space: O(1), only constant space is used.
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        var cur: TreeNode? = root

        while let curVal = cur?.val {
            if curVal > val {
                guard cur?.left != nil else {
                    cur?.left = TreeNode(val)
                    break
                }
                cur = cur?.left
            } else {
                guard cur?.right != nil else {
                    cur?.right = TreeNode(val)
                    break
                }
                cur = cur?.right
            }
        }

        return root
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
