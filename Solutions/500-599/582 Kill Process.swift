//
//  582 Kill Process.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 15/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/kill-process/
class Solution {

    /// Finds a list of PIDs of processes that will be killed.
    ///
    /// - Parameters:
    ///   - pid: A list of the process IDs.
    ///   - ppid: A list of process parent ID.
    ///   - kill: An ID of the process to kill.
    /// - Returns: A list of PIDs.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of processes.
    ///   - space: O(n), where n is the number of processes.
    func killProcess(_ pid: [Int], _ ppid: [Int], _ kill: Int) -> [Int] {
        var dict = [Int: [Int]]()
        
        for (i, id) in pid.enumerated() {
            dict[ppid[i], default: [Int]()].append(id)
        }
        
        var ans = [Int]()
        var stack = [Int]()
        stack.append(kill)
        
        while !stack.isEmpty {
            let cur = stack.removeLast()
            ans.append(cur)
            guard let children = dict[cur] else { continue }
            stack.append(contentsOf: children)
        }
        
        return ans
    }

}
