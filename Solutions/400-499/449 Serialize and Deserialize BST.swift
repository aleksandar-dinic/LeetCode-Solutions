//
//  449 Serialize and Deserialize BST.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 09/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/serialize-and-deserialize-bst/
class Codec {

    /// Serializes binary search tree.
    ///
    /// - Parameter root: The binary search tree root.
    /// - Returns: Serialized data.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func serialize(_ root: TreeNode?) -> String {
        var ans = ""
        serialize(root, &ans)
        return ans
    }

    private func serialize(_ root: TreeNode?, _ ans: inout String) {
        guard let root = root else { return }

        ans = "\(ans)\(root.val),"
        serialize(root.left, &ans)
        serialize(root.right, &ans)
    }

    /// Deserializes binary search tree.
    ///
    /// - Parameter data: Serialized data.
    /// - Returns: The binary search tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the tree.
    ///   - space: O(n), where n is the number of nodes in the tree.
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        var queue = data.split(separator: ",").map { String($0) }
        return deserialize(&queue, Int.min, Int.max)
    }

    private func deserialize(_ queue: inout [String], _ lower: Int, _ upper: Int) -> TreeNode? {
        guard !queue.isEmpty else { return nil }

        guard
            let first = queue.first,
            let val = Int(first),
            lower < val, val < upper
        else { return nil }

        queue.removeFirst()

        var root = TreeNode(val)
        root.left = deserialize(&queue, lower, val)
        root.right = deserialize(&queue, val, upper)
        return root
    }

}

/// Provided code
public class TreeNode {

    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }

}
