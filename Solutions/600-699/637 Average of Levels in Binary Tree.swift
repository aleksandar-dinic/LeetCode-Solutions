//
//  637 Average of Levels in Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 06/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/average-of-levels-in-binary-tree/
class Solution {

    /// Finds the average value of the nodes on each level in the form of an
    /// array.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: The average value of the nodes on each level.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var ans = [Double]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var tmp = 0
            var count = queue.count
            
            for i in 0..<count {
                let first = queue.removeFirst()
                tmp += first.val
                if let left = first.left {
                    queue.append(left)
                }
                if let right = first.right {
                    queue.append(right)
                }
            }
            
            ans.append(Double(tmp) / Double(count))
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
