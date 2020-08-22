//
//  497 Random Point in Non-overlapping Rectangles.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/random-point-in-non-overlapping-rectangles/
class Solution {

    private let rects: [[Int]]
    private var psum: [Int]
    private var total: Int

    /// Initialization of data structures.
    ///
    /// - Parameter rects: A list of non-overlapping axis-aligned rectangles.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of *rects*.
    ///   - space: O(n), where n is the length of *rects*.
    init(_ rects: [[Int]]) {
        self.rects = rects
        psum = [Int]()
        total = 0

        for rect in rects {
            total += (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
            psum.append(total)
        }
    }

    /// Randomly and uniformly picks an integer point in the space covered by the
    /// rectangles.
    ///
    /// - Returns: Integer point in the space covered by the rectangles.
    ///
    /// - Complexity:
    ///   - time: O(log(n)), where n is the length of *rects*.
    ///   - space: O(1), only constant space is used.
    func pick() -> [Int] {
        let target = Int.random(in: 0..<total)

        var start = 0
        var end = rects.count - 1

        while start != end {
            let mid = start + (end - start) / 2

            if target >= psum[mid] {
                start = mid + 1
            } else {
                end = mid
            }
        }

        let rect = rects[start]
        let width = rect[2] - rect[0] + 1
        let height = rect[3] - rect[1] + 1
        let base = psum[start] - width * height

        return [rect[0] + (target - base) % width, rect[1] + (target - base) / width]
    }

}
