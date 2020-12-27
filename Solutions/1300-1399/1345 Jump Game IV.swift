//
//  1345 Jump Game IV.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 27/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/jump-game-iv/
class Solution {

    /// Finds the minimum number of steps to reach the last index of the array.
    ///
    /// - Parameter arr: An array of integers.
    /// - Returns: The minimum number of steps.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of `arr`.
    ///   - space: O(n), where n is the length of `arr`.
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        guard n > 1 else { return 0 }
        
        var graph = [Int: [Int]]()
        for i in 0..<n {
            graph[arr[i], default: [Int]()].append(i)
        }
        
        var cur = [Int]()
        cur.append(0)
        var visited = Set<Int>()
        var step = 0
        
        while !cur.isEmpty {
            var next = [Int]()
            
            for node in cur {
                guard node != n - 1 else { return step }
                
                for child in graph[arr[node]] ?? [] {
                    guard !visited.contains(child) else { continue }
                    visited.insert(child)
                    next.append(child)
                }
                
                graph.removeValue(forKey: arr[node])

                if node + 1 < n, !visited.contains(node + 1) {
                    visited.insert(node + 1)
                    next.append(node + 1)
                }
                
                if node - 1 >= 0, !visited.contains(node - 1) {
                    visited.insert(node - 1)
                    next.append(node - 1)
                }
            }
            
            cur = next
            step += 1
        }
        
        return -1
    }

}
