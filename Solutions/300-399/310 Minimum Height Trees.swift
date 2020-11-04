//
//  310 Minimum Height Trees.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/11/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/minimum-height-trees/
class Solution {

    /// Finds a list of all minimum height trees root labels.
    ///
    /// - Parameters:
    ///   - n: The number of nodes in the graph.
    ///   - edges: An array of edges.
    /// - Returns: The list of all minimum height trees roots labels.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the graph.
    ///   - space: O(n), where n is the number of nodes in the graph.
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }

        var neighbors = Array(repeating: Set<Int>(), count: n)
        var inDegrees = Array(repeating: 0, count: n)

        for edge in edges {
            neighbors[edge[0]].insert(edge[1])
            neighbors[edge[1]].insert(edge[0])
            inDegrees[edge[0]] += 1
            inDegrees[edge[1]] += 1
        }

        var leaves = [Int]()
        for (node, degree) in inDegrees.enumerated() {
            guard degree == 1 else { continue }
            leaves.append(node)
        }

        var n = n
        while n > 2 {
            n -= leaves.count

            var newLeaves = [Int]()
            for leaf in leaves {
                guard let neighbor = neighbors[leaf].first else { continue }

                neighbors[neighbor].remove(leaf)
                inDegrees[leaf] -= 1
                inDegrees[neighbor] -= 1

                guard inDegrees[neighbor] == 1 else { continue }
                newLeaves.append(neighbor)
            }

            leaves = newLeaves
        }

        return leaves
    }

}
