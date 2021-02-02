//
//  669 Trim a Binary Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/trim-a-binary-search-tree/
class Solution {

    /// Trims the tree so that all its elements lie in `[low, high]`.
    ///
    /// - Parameters:
    ///   - root: Binary tree root.
    ///   - low: Lowest boundary.
    ///   - high: Highest boundary.
    /// - Returns: The root of the trimmed binary search tree.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val > high {
            return trimBST(root.left, low, high)
        }
        if root.val < low {
            return trimBST(root.right, low, high)
        }
        
        root.left = trimBST(root.left, low, high)
        root.right = trimBST(root.right, low, high)
        return root
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
