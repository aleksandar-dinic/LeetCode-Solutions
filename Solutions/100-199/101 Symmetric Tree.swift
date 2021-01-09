//
//  101 Symmetric Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/symmetric-tree/
class Solution {

    /// Finds if a binary tree is a mirror of himself.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: True if a binary tree is a mirror, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func isSymmetric(_ root: TreeNode?) -> Bool {
        isMirror(root, root)
    }
    
    private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil {
            return true
        }
        guard left?.val == right?.val else { return false }
        
        return isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
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
