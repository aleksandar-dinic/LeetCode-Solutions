//
//  1506 Find Root of N-Ary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-root-of-n-ary-tree/
class Solution {

    /// Finds the root of the N-ary tree.
    ///
    /// - Parameter tree: An array of nodes.
    /// - Returns: The root of the N-ary tree.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(1), only constant space is used.
    func findRoot(_ tree: [Node]) -> Node? {
        var sum = 0
        
        for node in tree {
            sum += node.val
            for child in node.children {
                sum -= child.val
            }
        }
        
        for node in tree {
            guard node.val == sum else { continue }
            return node
        }
        
        return nil
    }

}

/// Provided code
public class Node {
    
    public var val: Int
    public var children: [Node]
    
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
    
}
