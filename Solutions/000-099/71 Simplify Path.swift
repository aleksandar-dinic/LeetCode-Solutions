//
//  71 Simplify Path.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 05/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/simplify-path/
class Solution {

    /// Finds the simplified canonical path.
    ///
    /// - Parameter path: An absolute path.
    /// - Returns: The simplified canonical path.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `path`.
    ///   - space: O(n), where n is the length of `path`.
    func simplifyPath(_ path: String) -> String {
        let paths = path.split(separator: "/")
        
        var stack = [String]()
        for path in paths {
            guard path != ".", !path.isEmpty else { continue }
            
            if path == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(String(path))
            }
        }
        
        return "/\(stack.joined(separator: "/"))"
    }

}
