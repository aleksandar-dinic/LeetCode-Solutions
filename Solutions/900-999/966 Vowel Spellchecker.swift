//
//  966 Vowel Spellchecker.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 22/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/vowel-spellchecker/
class Solution {
    
    private var wordsPerfect = Set<String>()
    private var wordsCap = [String: String]()
    private var wordsVow = [String: String]()
    
    /// Converts a query word into a correct word.
    ///
    /// - Parameters:
    ///   - wordlist: A list of words.
    ///   - queries: A query word.
    /// - Returns: The correct words.
    ///
    /// - Complexity:
    ///     - time: O(max(n, m)), where n is the length of `wordlist`, and m is the
    ///     length of `queries`.
    ///     - space: O(max(n, m)), where n is the length of `wordlist`, and m is the
    ///     length of `queries`.
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        for word in wordlist {
            wordsPerfect.insert(word)
            
            let wordlow = word.lowercased()
            if !wordsCap.keys.contains(wordlow) {
                wordsCap[wordlow] = word
            }
            
            let wordlowDV = devowel(wordlow)
            if !wordsVow.keys.contains(wordlowDV) {
              wordsVow[wordlowDV] = word
            }
        }
        
        var ans = [String]()
        for query in queries {
            ans.append(solve(query))
        }
        return ans
    }
    
    private func solve(_ query: String) -> String {
        guard !wordsPerfect.contains(query) else { return query }
        
        let wordlow = query.lowercased()
        if let val = wordsCap[wordlow] {
            return val
        }
        if let val = wordsVow[devowel(wordlow)] {
            return val
        }
        return ""
    }
    
    private func devowel(_ word: String) -> String {
        var ans = [Character]()
        
        for ch in word {
            ans.append(isVowel(ch) ? "*" : ch)
        }
        
        return String(ans)
    }
    
    private func isVowel(_ ch: Character) -> Bool {
        ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u"
    }

}
