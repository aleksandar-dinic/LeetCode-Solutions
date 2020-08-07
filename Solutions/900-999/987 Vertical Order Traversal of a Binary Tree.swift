//
//  987 Vertical Order Traversal of a Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 07/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/
class Solution {

    /// Returns the vertical order traversal of a binary tree nodes values.
    ///
    /// - Parameter root: Binary tree root.
    /// - Returns: A list of non-empty reports in order of X coordinate.
    ///
    /// - Complexity:
    ///     - time: O(n log(n)), where n is the number of nodes.
    ///     - space: O(n log(n)), where n is the number of nodes.
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int: [(Int, Int)]]()
        dfs(root, x: 0, y: 0, dict: &dict)
        var ans = [[Int]]()

        for key in dict.keys.sorted() {
            guard let val = dict[key] else { continue }
            let v = val.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 >= $1.0 }
            ans.append(v.map { $0.1 })
        }

        return ans
    }

    private func dfs(_ root: TreeNode?, x: Int, y: Int, dict: inout [Int: [(Int, Int)]]) {
        guard let root = root else { return }

        dict[x, default: [(Int, Int)]()].append((y, root.val))
        dfs(root.left, x: x - 1, y: y - 1, dict: &dict)
        dfs(root.right, x: x + 1, y: y - 1, dict: &dict)
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
