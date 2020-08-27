//
//  157 Read N Characters Given Read4.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/read-n-characters-given-read4/
class Solution: Reader4 {

    /// Reads n characters.
    ///
    /// - Parameters:
    ///   - buf: Destination buffer.
    ///   - n: The number of characters to read.
    /// - Returns: The number of actual characters reads.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of characters to read.
    ///   - space: O(1), only constant space is used.
    func read(_ buf: inout [Character], _ n: Int) -> Int {
        var copiedChars = 0
        var readChars = 4
        var tmpBuf = [Character](repeating: " ", count: 4)

        while copiedChars < n, readChars == 4 {
            readChars = read4(&tmpBuf)

            for i in 0..<readChars {
                guard copiedChars != n else { return copiedChars }
                buf[copiedChars] = tmpBuf[i]
                copiedChars += 1
            }
        }

        return copiedChars
    }
}

/// Provided Code
class Reader4 {

    func read4(_ buf4: inout [Character]) -> Int

}
