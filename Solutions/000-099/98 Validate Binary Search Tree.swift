//
//  98 Validate Binary Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 16/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/validate-binary-search-tree/
class Solution {

    private var prev: Int?
    
    /// Determines if a binary tree is a valid binary search tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: True if the given tree is a valid binary search tree, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func isValidBST(_ root: TreeNode?) -> Bool {
        inorder(root)
    }
    
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        guard inorder(root.left) else { return false }
        
        if let prev = prev, root.val <= prev {
            return false
        }
        
        prev = root.val
        return inorder(root.right)
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
