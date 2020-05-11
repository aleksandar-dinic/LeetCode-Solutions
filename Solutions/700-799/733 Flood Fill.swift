//
//  733 Flood Fill.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 11/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source:  https://leetcode.com/problems/flood-fill/
class Solution {

    /// Replaces the old color in the image with the new color.
    ///
    /// - Parameters:
    ///   - image: 2-D array of integers.
    ///   - sr: Starting row.
    ///   - sc: Starting column.
    ///   - newColor: New color.
    /// - Returns: Modified image.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of pixels in the image.
    ///     - space: O(n), where n is the number of pixels in the image.
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        guard image[sr][sc] != newColor else { return image }

        var image = image
        dfs(&image, row: sr, col: sc, newColor: newColor, oldColor: image[sr][sc])

        return image
    }

    private func dfs(_ image: inout [[Int]], row: Int, col: Int, newColor: Int, oldColor: Int) {
        image[row][col] = newColor

        if row + 1 < image.count, image[row+1][col] == oldColor {
            dfs(&image, row: row + 1, col: col, newColor: newColor, oldColor: oldColor)
        }

        if row - 1 >= 0, image[row-1][col] == oldColor {
            dfs(&image, row: row - 1, col: col, newColor: newColor, oldColor: oldColor)
        }

        if col + 1 < image[row].count, image[row][col+1] == oldColor {
            dfs(&image, row: row, col: col + 1, newColor: newColor, oldColor: oldColor)
        }

        if col - 1 >= 0, image[row][col-1] == oldColor {
            dfs(&image, row: row, col: col - 1, newColor: newColor, oldColor: oldColor)
        }
    }

}
