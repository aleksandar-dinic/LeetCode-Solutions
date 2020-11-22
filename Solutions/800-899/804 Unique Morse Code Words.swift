//
//  804 Unique Morse Code Words.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/unique-morse-code-words/
class Solution {

    /// Finds the number of different transformations among all words.
    ///
    /// - Parameter words: A list of words.
    /// - Returns: The number of different transformations.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the sum of the lengths of words in the `words`.
    ///     - space: O(m), where m is the length of the `words`.
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var ans = Set<String>()

        for word in words {
            var tmp = ""
            for ch in word {
                guard let morseCh = morse[ch] else { continue }
                tmp = "\(tmp)\(morseCh)"
            }
            guard tmp != "" else { continue }
            ans.insert(tmp)
        }

        return ans.count
    }

    private let morse: [Character: String] = [
        "a": ".-",
        "b": "-...",
        "c": "-.-.",
        "d": "-..",
        "e": ".",
        "f": "..-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": ".---",
        "k": "-.-",
        "l": ".-..",
        "m": "--",
        "n": "-.",
        "o": "---",
        "p": ".--.",
        "q": "--.-",
        "r": ".-.",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "...-",
        "w": ".--",
        "x": "-..-",
        "y": "-.--",
        "z": "--.."
    ]

}
