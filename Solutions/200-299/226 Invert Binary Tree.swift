//
//  226 Invert Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/invert-binary-tree/
class Solution {

    /// Inverts a binary tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: Inverted binary tree.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the tree.
    ///     - space: O(n), where n is the number of nodes in the tree.
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
                
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        root.left = right
        root.right = left
        
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
