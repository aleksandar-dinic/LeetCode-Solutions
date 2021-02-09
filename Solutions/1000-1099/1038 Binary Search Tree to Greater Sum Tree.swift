//
//  1038 Binary Search Tree to Greater Sum Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
class Solution {

    /// Converts BST to a Greater Tree such that every key of the original BST
    /// is changed to the original key plus the sum of all keys greater than the
    /// original key in BST.
    ///
    /// - Parameter root: Binary search tree root.
    /// - Returns: Greater Tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        dfs(root, &sum)
        return root
    }
    
    private func dfs(_ root: TreeNode?, _ sum: inout Int) {
        guard let root = root else { return }
        
        dfs(root.right, &sum)
        sum += root.val
        root.val = sum
        dfs(root.left, &sum)
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
