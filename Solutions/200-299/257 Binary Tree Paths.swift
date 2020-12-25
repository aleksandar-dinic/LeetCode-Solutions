//
//  257 Binary Tree Paths.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 25/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-paths/
class Solution {

    /// Finds all root-to-leaf paths.
    ///
    /// - Parameter root: Binary root tree.
    /// - Returns: All root-to-leaf paths.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var ans = [String]()
        dfs(root, path: "", ans: &ans)
        return ans
    }
    
    private func dfs(_ node: TreeNode?, path: String, ans: inout [String]) {
        guard let node = node else { return }
        
        let path = "\(path)\(node.val)"
        if node.left == nil, node.right == nil {
            ans.append(path)
        } else {
            dfs(node.left, path: "\(path)->", ans: &ans)
            dfs(node.right, path: "\(path)->", ans: &ans)
        }
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
