//
//  535 Encode and Decode TinyURL.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/encode-and-decode-tinyurl/
class Codec {
    
    private let alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    private var dict = [String: String]()
    
    /// Encodes a URL to a shortened URL.
    ///
    /// - Parameter longUrl: The long URL.
    /// - Returns: The short URL.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(n), where n is the number of `longUrl`.
    func encode(_ longUrl: String) -> String {
        var newKey = key
        while dict.keys.contains(newKey) {
            newKey = key
        }
        dict[newKey] = longUrl
        return "http://tinyurl.com/\(newKey)"
    }
    
    /// Decodes a shortened URL to its original URL.
    ///
    /// - Parameter shortUrl: The short URL.
    /// - Returns: The long URL.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func decode(_ shortUrl: String) -> String {
        let key = shortUrl.replacingOccurrences(of: "http://tinyurl.com/", with: "")
        return dict[key] ?? ""
    }
    
    private var key: String {
        String(alphabet.shuffled().prefix(6))
    }

}
