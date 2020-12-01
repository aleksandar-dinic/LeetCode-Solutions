//
//  108 Convert Sorted Array to Binary Search Tree.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
class Solution {

    /// Converts an array where elements are sorted in ascending order to a height
    /// balanced BST.
    ///
    /// - Parameter nums: An array.
    /// - Returns: Binary Search Tree root.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `nums`.
    ///   - space: O(n), where n is the length of `nums`.
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        helper(nums, 0, nums.count - 1)
    }

    private func helper(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        guard lo <= hi else { return nil }

        let mid = lo + (hi - lo) / 2

        let root = TreeNode(nums[mid])
        root.left = helper(nums, lo, mid - 1)
        root.right = helper(nums, mid + 1, hi)

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
