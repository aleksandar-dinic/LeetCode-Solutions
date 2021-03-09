//
//  623 Add One Row to Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/add-one-row-to-tree/
class Solution {

    /// Adds one row to the tree.
    ///
    /// - Parameters:
    ///   - root: Binary tree root.
    ///   - v: The value.
    ///   - d: The depth.
    /// - Returns: Binary tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        guard d > 1 else { return TreeNode(v, root, nil) }
        guard let root = root else { return TreeNode(v) }
        var queue = [TreeNode]()
        queue.append(root)
        
        var depth = 1
        while depth < d - 1 {
            var tmp = [TreeNode]()
            while !queue.isEmpty {
                let node = queue.removeFirst()
                if let left = node.left {
                    tmp.append(left)
                }
                if let right = node.right {
                    tmp.append(right)
                }
            }
            queue = tmp
            depth += 1
        }

        while !queue.isEmpty {
            let node = queue.removeFirst()
            node.left = TreeNode(v, node.left, nil)
            node.right = TreeNode(v, nil, node.right)
        }
        
        return root
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
