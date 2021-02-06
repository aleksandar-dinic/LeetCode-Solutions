//
//  199 Binary Tree Right Side View.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-tree-right-side-view/
class Solution {

    /// Finds the values of the nodes you can see ordered from top to bottom
    /// when you are standing on the right side of the tree.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: Visible values of the nodes.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [TreeNode]()
        queue.append(root)
        
        var ans = [Int]()
        while !queue.isEmpty {
            if let last = queue.last {
                ans.append(last.val)
            }
            
            for i in 0..<queue.count {
                let node = queue.removeFirst()
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
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
