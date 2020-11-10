//
//  832 Flipping an Image.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/flipping-an-image/
class Solution {

    /// Flips the image horizontally, then inverts it.
    ///
    /// - Parameter A: A binary matrix.
    /// - Returns: The resulting image.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of elements in `A`.
    ///     - space: O(n), where n is the number of elements in `A`.
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var ans = A

        for i in 0..<ans.count {
            for j in 0..<(ans[i].count + 1) / 2 {
                let tmp = ans[i][j] ^ 1
                ans[i][j] = ans[i][ans[i].count - j - 1] ^ 1
                ans[i][ans[i].count - j - 1] = tmp
            }
        }

        return ans
    }

}
