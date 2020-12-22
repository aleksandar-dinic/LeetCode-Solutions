//
//  1602 Find Nearest Right Node in Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-nearest-right-node-in-binary-tree/
class Solution {

    private var uDepth = -1
    private var nextNode: TreeNode?
    private var u: TreeNode?
    
    /// Finds the nearest node on the same level that is to the right of `u`, or
    /// return nil if `u` is the rightmost node in its level.
    ///
    /// - Parameters:
    ///   - root: Binary tree root.
    ///   - u: A node in the tree.
    /// - Returns: The nearest node on the same level to the right if exist,
    /// otherwise returns nil.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        self.u = u
        preorder(root, 0)
        return nextNode
    }
    
    private func preorder(_ node: TreeNode?, _ depth: Int) {
        if node?.val == u?.val {
            uDepth = depth
        } else if depth == uDepth {
            if nextNode == nil {
                nextNode = node
            }
        } else {
            if let left = node?.left {
                preorder(left, depth + 1)
            }
            if let right = node?.right {
                preorder(right, depth + 1)
            }
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
