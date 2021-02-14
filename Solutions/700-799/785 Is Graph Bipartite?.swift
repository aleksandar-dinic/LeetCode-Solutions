//
//  785 Is Graph Bipartite?.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/is-graph-bipartite/
class Solution {

    /// Finds if the given graph is bipartite.
    ///
    /// - Parameter graph: An undirected `graph`.
    /// - Returns: True if the given graph is bipartite, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(n + e), where n is the number of nodes in the `graph`, and e
    ///     is the number of edges in the `graph`.
    ///     - space: O(n), where n is the number of nodes in the `graph`.
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        var color = [Int](repeating: -1, count: n)
        
        for i in 0..<n {
            guard color[i] == -1 else { continue }
            var stack = [Int]()
            stack.append(i)
            color[i] = 0
            
            while !stack.isEmpty {
                let node = stack.removeLast()
                for nei in graph[node] {
                    if color[nei] == -1 {
                        stack.append(nei)
                        color[nei] = color[node] ^ 1
                    } else if color[nei] == color[node] {
                        return false
                    }
                }
            }
        }
        
        return true
    }

}
