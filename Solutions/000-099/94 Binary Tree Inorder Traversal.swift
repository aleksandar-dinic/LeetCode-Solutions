//
//  94 Binary Tree Inorder Traversal.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-inorder-traversal/
class Solution {

    /// Binary tree inorder traversal.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: Inorder traversal.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of nodes in the tree.
    ///     - space: O(n), where n is the number of nodes in the tree.
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        var stack = [TreeNode?]()
        var curr = root

        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            curr = stack.removeLast()
            if let val = curr?.val {
                ans.append(val)
            }
            curr = curr?.right
        }

        return ans
    }

}

/// Provided code
public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
}
