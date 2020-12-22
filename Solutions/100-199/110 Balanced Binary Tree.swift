//
//  110 Balanced Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/balanced-binary-tree/
class Solution {

    /// Finds if a binary tree is height-balanced.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: True if the binary tree is height-balanced, otherwise returns
    ///   false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func isBalanced(_ root: TreeNode?) -> Bool {
        isBalancedTree(root).balanced
    }
    
    private func isBalancedTree(_ node: TreeNode?) -> (height: Int, balanced: Bool) {
        guard let node = node else { return (-1, true) }
        
        let left = isBalancedTree(node.left)
        guard left.balanced else { return (-1, false) }
        
        let right = isBalancedTree(node.right)
        guard right.balanced else { return (-1, false) }
        
        guard abs(left.height - right.height) < 2 else { return (-1, false) }
        
        return (max(left.height, right.height) + 1, true)
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
