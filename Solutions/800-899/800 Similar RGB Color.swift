//
//  800 Similar RGB Color.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/similar-rgb-color/
class Solution {

    /// Finds a 7 character color that is most similar to a given color, and has a
    /// shorthand.
    ///
    /// - Parameter color: The color.
    /// - Returns: A 7 character color.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func similarRGB(_ color: String) -> String {
        let color = Array(color)
        var ans = "#"
        
        for i in 0..<3 {
            guard let tmp = Int(String(color[(i*2+1)..<(i*2+3)]), radix: 16) else {
                fatalError("Invalid color")
            }
            let round = ((tmp + 8) / 17) * 17
            ans = round > 0 ? "\(ans)\(String(round, radix: 16))" : "\(ans)00"
        }
        
        return ans
    }

}
