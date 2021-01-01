//
//  1640 Check Array Formation Through Concatenation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 01/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/check-array-formation-through-concatenation/
class Solution {

    /// Finds if it is possible to form the array `arr` from `pieces`.
    ///
    /// - Parameters:
    ///   - arr: An array of distinct integers.
    ///   - pieces: An array of integer arrays.
    /// - Returns: True if it is possible to form the array, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `arr`.
    ///   - space: O(n), where n is the length of `arr`.
    func canFormArray(_ arr: [Int], _ pieces: [[Int]]) -> Bool {
        var dict = [Int: [Int]]()
        
        for piece in pieces {
            guard !piece.isEmpty else { continue }
            dict[piece[0]] = piece
        }
        
        let n = arr.count
        var i = 0
        
        while i < n {
            guard let targetPiece = dict[arr[i]] else { return false }
            
            for piece in targetPiece {
                guard piece == arr[i] else { return false }
                i += 1
            }
        }
        
        return true
    }

}
