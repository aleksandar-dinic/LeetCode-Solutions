//
//  383 Ransom Note.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 03/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/ransom-note/
class Solution {

    /// Findes if ransom note can be constructed from the magazines.
    ///
    /// - Parameters:
    ///   - ransomNote: Ransom note string
    ///   - magazine: Magazine string
    ///
    /// - Returns: True if the ransom note can be constructed, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(m), where m is the number of letters in magazine.
    ///   - space: O(m), where m is the number of letters in magazine.
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard magazine.count >= ransomNote.count else { return false }

        var dict = [Character: Int]()

        for mag in magazine {
            dict[mag, default: 0] += 1
        }

        for ran in ransomNote {
            guard let val = dict[ran] else { return false }
            dict[ran] = val == 1 ? nil : val - 1
        }

        return true
    }

}
