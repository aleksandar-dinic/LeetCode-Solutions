//
//  84 Largest Rectangle in Histogram.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 31/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/largest-rectangle-in-histogram/
class Solution {

    /// Finds the area of the largest rectangle in the histogram.
    ///
    /// - Parameter heights: An array of integers.
    /// - Returns: The area of the largest rectangle.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `heights`.
    ///   - space: O(n), where n is the length of `heights`.
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        let n = heights.count
        var ans = 0
        
        for i in 0..<n {
            while let curHeight = stack.last, heights[curHeight] >= heights[i] {
                stack.removeLast()
                let curWidth = stack.last ?? -1
                ans = max(ans, heights[curHeight] * (i - curWidth - 1))
            }
            stack.append(i)
        }
        
        while !stack.isEmpty {
            let curHeight = stack.removeLast()
            let curWidth = stack.last ?? -1
            ans = max(ans, heights[curHeight] * (n - curWidth - 1))
        }
        
        return ans
    }

}
