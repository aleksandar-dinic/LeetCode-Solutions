//
//  605 Can Place Flowers.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/can-place-flowers/
class Solution {

    /// Finds if `n` new flowers can be planted in the `flowerbed` without violating
    /// the no-adjacent-flowers rule.
    ///
    /// - Parameters:
    ///   - flowerbed: An integer array containing 0's and 1's.
    ///   - n: The number of new flowers.
    /// - Returns: True if `n` new flowers can be planted, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the length of the `flowerbed`.
    ///   - space: O(m), where m is the length of the `flowerbed`.
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard n > 0 else { return true }
        
        var n = n
        var flowerbed = flowerbed
        let count = flowerbed.count
        
        for i in 0..<count {
            guard flowerbed[i] == 0 else { continue }
            
            if (i == 0 || flowerbed[i-1] == 0) && (i == count - 1 || flowerbed[i+1] == 0) {
                flowerbed[i] = 1
                n -= 1
            }
            
            guard n == 0 else { continue }
            return true
        }
        
        return false
    }

}
