//
//  133 Clone Graph.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/clone-graph/
class Solution {

    /// Makes a deep copy (clone) of a connected undirected graph.
    ///
    /// - Parameter node: A reference of a node in the graph.
    /// - Returns: Clone of the graph.
    ///
    /// - Complexity:
    ///   - time: O(n + m), where n is the number of nodes in the graph, and m
    ///   is the number of edges in the graph.
    ///   - space: O(n), where n is the number of nodes in the graph.
    func cloneGraph(_ node: Node?) -> Node? {
        var visited = [Int: Node]()
        return cloneGraphDFS(node, visited: &visited)
    }

    func cloneGraphDFS(_ node: Node?, visited: inout [Int: Node]) -> Node? {
        guard let node = node else { return nil }

        let newNode = Node(node.val)
        visited[node.val] = newNode

        for neighbor in node.neighbors {
            guard let neighbor = neighbor else { continue }

            if let n = visited[neighbor.val] {
                newNode.neighbors.append(n)
            } else {
                let n = cloneGraphDFS(neighbor, visited: &visited)
                newNode.neighbors.append(n)
            }
        }

        return newNode
    }

}

/// Provided code
public class Node {

    public var val: Int
    public var neighbors: [Node?]

    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }

}
