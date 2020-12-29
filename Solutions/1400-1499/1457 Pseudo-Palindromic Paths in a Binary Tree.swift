//
//  1457 Pseudo-Palindromic Paths in a Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
class Solution {

    /// Finds the number of pseudo-palindromic paths going from the root node to
    /// leaf nodes.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The number of pseudo-palindromic paths.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func pseudoPalindromicPaths(_ root: TreeNode?) -> Int {
        dfs(root, 0)
    }
    
    private func dfs(_ node: TreeNode?, _ path: Int) -> Int {
        guard let node = node else { return 0 }
        
        var path = path ^ 1 << (node.val - 1)
        var ans = dfs(node.left, path) + dfs(node.right, path)
        
        if node.left == nil, node.right == nil, path & (path - 1) == 0 {
            ans += 1
        }
        
        return ans
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
