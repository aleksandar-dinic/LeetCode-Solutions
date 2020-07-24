//
//  797 All Paths From Source to Target.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/all-paths-from-source-to-target/
class Solution {

    /// Finds all possible paths from node 0 to node N-1.
    ///
    /// - Parameter graph: The graph.
    /// - Returns: All possible paths from node 0 to node N-1.
    ///
    /// - Complexity:
    ///     - time: O(V + E), where V represents the number of vertices and E represents the
    ///     number of edges.
    ///     - space: O(V * 2^V), where V represents the number of vertices.
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var dict = [Int: [[Int]]]()
        return dfs(graph, node: 0, dict: &dict)
    }

    private func dfs(_ graph: [[Int]], node: Int, dict: inout [Int: [[Int]]]) -> [[Int]] {
        if let path = dict[node] {
            return path
        }
        var ans = [[Int]]()

        if node == graph.count - 1 {
            ans.append([node])
        } else {
            for nextNode in graph[node] {
                let paths = dfs(graph, node: nextNode, dict: &dict)
                for var path in paths {
                    path.insert(node, at: 0)
                    ans.append(path)
                }
            }
        }

        dict[node] = ans
        return ans
    }

}
