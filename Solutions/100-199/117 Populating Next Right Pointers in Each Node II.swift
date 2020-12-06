//
//  117 Populating Next Right Pointers in Each Node II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/
class Solution {

    private var prev: Node?
    private var leftMost: Node?
    
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
        guard let root = root else { return nil }
        
        leftMost = root
        var curr = leftMost
        
        while leftMost != nil {
            prev = nil
            curr = leftMost
            leftMost = nil
            
            while curr != nil {
                processChild(curr?.left)
                processChild(curr?.right)
                curr = curr?.next
            }
        }
        
        return root
    }
    
    private func processChild(_ node: Node?) {
        guard let node = node else { return }
        
        if prev != nil {
            prev?.next = node
        } else {
            leftMost = node
        }
        
        prev = node
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
