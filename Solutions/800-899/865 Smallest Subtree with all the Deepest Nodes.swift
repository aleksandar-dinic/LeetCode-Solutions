//
//  865 Smallest Subtree with all the Deepest Nodes.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/
class Solution {

    /// Finds the smallest subtree such that it contains all the deepest nodes in
    /// the original tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The smallest subtree.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the tree.
    ///     - space: O(n), where n is the number of nodes in the tree.
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        dfs(root).node
    }
    
    private func dfs(_ root: TreeNode?) -> (node: TreeNode?, dist: Int) {
        guard let root = root else { return (nil, 0) }
        
        let left = dfs(root.left)
        let right = dfs(root.right)
        
        if left.dist > right.dist {
            return (left.node, left.dist + 1)
        }
        
        if left.dist < right.dist {
            return (right.node, right.dist + 1)
        }
        
        return (root, left.dist + 1)
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
