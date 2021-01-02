//
//  276 Paint Fence.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 02/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/paint-fence/
class Solution {

    /// Finds the total number of ways you can paint the fence.
    ///
    /// - Parameters:
    ///   - n: The number of posts.
    ///   - k: The number of colors.
    /// - Returns: The total number of ways.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of posts.
    ///   - space: O(1), only constant space is used.
    func numWays(_ n: Int, _ k: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 1 else { return k }
        
        var same = 0
        var diff = k
        
        for i in 2...n {
            let tmp = same
            same = diff
            diff = (tmp + diff) * (k - 1)
        }
        
        return same + diff
    }

}
