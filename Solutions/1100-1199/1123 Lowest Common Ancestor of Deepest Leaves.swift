//
//  1123 Lowest Common Ancestor of Deepest Leaves.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/
class Solution {

    /// Finds the lowest common ancestor of its deepest leaves.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The lowest common ancestor of its deepest leaves.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the tree.
    ///     - space: O(n), where n is the number of nodes in the tree.
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
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
