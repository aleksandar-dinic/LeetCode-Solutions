//
//  604 Design Compressed String Iterator.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/design-compressed-string-iterator/
class StringIterator {
    
    private let str: [Character]
    private let n: Int
    private var cur = 0
    private var num = 0
    private var ch = Character(" ")
    
    /// Initialization of data structures.
    ///
    /// - Parameter compressedString: The compressed string.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the `compressedString`.
    ///   - space: O(n), where n is the length of the `compressedString`.
    init(_ compressedString: String) {
        str = Array(compressedString)
        n = str.count
    }
    
    /// Returns the next character if the original string still has uncompressed
    /// characters, otherwise returns a white space.
    ///
    /// - Returns: The next character.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func next() -> Character {
        guard hasNext() else { return " " }

        if num == 0 {
            ch = str[cur]
            cur += 1
            while cur < n, let digit = Int(String(str[cur])) {
                num = num * 10 + digit
                cur += 1
            }
        }
        
        num -= 1
        return ch
    }
    
    /// Check if the string has the next character.
    ///
    /// - Returns: True if there is any letter that needs to be uncompressed in the
    ///   original string, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func hasNext() -> Bool {
        cur != n || num != 0
    }

}
