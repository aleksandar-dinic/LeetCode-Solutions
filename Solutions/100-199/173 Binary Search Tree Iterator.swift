//
//  173 Binary Search Tree Iterator.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/binary-search-tree-iterator/
class BSTIterator {

    private var stack: [TreeNode]
    
    /// Initialization of data structures.
    ///
    /// - Parameter root: Binary tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), where n is the number of nodes in the binary tree.
    init(_ root: TreeNode?) {
        stack = [TreeNode]()
        leftMostInorder(root)
    }
    
    private func leftMostInorder(_ root: TreeNode?) {
        var root = root
        while let node = root {
            stack.append(node)
            root = root?.left
        }
    }
    
    /// Finds the next element.
    ///
    /// - Returns: The next element.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the binary tree.
    ///   - space: O(n), only constant space is used.
    func next() -> Int {
        let topMost = stack.removeLast()
        
        leftMostInorder(topMost.right)
        
        return topMost.val
    }
    
    /// Finds if the next element exists.
    ///
    /// - Returns: True if the next element exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func hasNext() -> Bool {
        !stack.isEmpty
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
