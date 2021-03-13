//
//  744 Find Smallest Letter Greater Than Target.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 13/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/find-smallest-letter-greater-than-target/
class Solution {

    /// Finds the smallest element in the list that is greater than the given
    /// `target`.
    ///
    /// - Parameters:
    ///   - letters: A list of sorted characters.
    ///   - target: A target letter.
    /// - Returns: The smallest element in the list greater than the given
    ///   `target`.
    ///
    /// - Complexity:
    ///     - time: O(log n), where n is the length of `letters`.
    ///     - space: O(1), only constant space is used.
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        let n = letters.count
        var start = 0
        var end = n
        
        while start < end {
            let mid = start + (end - start) / 2
            
            if letters[mid] <= target {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        return letters[start % n]
    }

}
