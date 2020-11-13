//
//  116 Populating Next Right Pointers in Each Node.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
class Solution {

    /// Populates each next pointer to point to its next right node. If there is no
    /// next right node, the next pointer should be set to nil.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: Binary tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(1), only constant space is used.
    func connect(_ root: Node?) -> Node? {
        var leftMost = root

        while leftMost?.left != nil {
            var head = leftMost

            while head != nil {
                head?.left?.next = head?.right

                if let next = head?.next {
                    head?.right?.next = next.left
                }

                head = head?.next
            }

            leftMost = leftMost?.left
        }

        return root
    }

}

/// Provided Code
public class Node {

    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }

}
