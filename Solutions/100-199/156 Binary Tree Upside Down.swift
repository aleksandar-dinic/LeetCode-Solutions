//
//  156. Binary Tree Upside Down.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-upside-down/
class Solution {

    /// Flips binary tree upside down.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The new root.
    ///
    /// - Complexity:
    ///   - time: O(log n), where n is the number of nodes.
    ///   - space: O(1), only constant space is used.
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        var curr = root
        var next: TreeNode? = nil
        var temp: TreeNode? = nil
        var prev: TreeNode? = nil

        while curr != nil {
            next = curr?.left

            curr?.left = temp
            temp = curr?.right
            curr?.right = prev

            prev = curr
            curr = next
        }

        return prev
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
