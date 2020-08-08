//
//  437 Path Sum III.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/path-sum-iii/
class Solution {

    /// Finds the number of paths that sum to a given value.
    ///
    /// - Parameters:
    ///   - root: Binary tree root.
    ///   - sum: The given value.
    /// - Returns: The number of paths.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes.
    ///   - space: O(n), where n is the number of nodes.
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        var dict = [Int: Int]()
        dict[0] = 1
        return pathSum(root, 0, sum, &dict)
    }

    private func pathSum(_ root: TreeNode?, _ currSum: Int, _ target: Int, _ dict: inout [Int: Int]) -> Int {
        guard let root = root else { return 0 }

        let currSum = currSum + root.val
        var ans = dict[currSum - target] ?? 0

        dict[currSum, default: 0] += 1
        ans += pathSum(root.left, currSum, target, &dict)
        ans += pathSum(root.right, currSum, target, &dict)
        dict[currSum, default: 0] -= 1

        return ans
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
