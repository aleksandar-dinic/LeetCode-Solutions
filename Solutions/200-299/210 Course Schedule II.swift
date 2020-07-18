//
//  210 Course Schedule II.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 18/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/course-schedule-ii/
class Solution {

    /// Finds the ordering of courses you should take to finish all courses.
    ///
    /// - Parameters:
    ///   - numCourses: Number of courses.
    ///   - prerequisites: A list of prerequisite pairs.
    /// - Returns: The ordering of courses you should take to finish all courses. If it is
    ///   impossible to finish all courses returns an empty array.
    ///
    /// - Complexity:
    ///   - time: O(V + E), where V represents the number of vertices and E represents the
    ///     number of edges.
    ///   - space: O(V + E), where V represents the number of vertices and E represents the
    ///     number of edges.
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var dict = [Int: [Int]]()
        var indegree = [Int](repeating: 0, count: numCourses)

        for prerequisit in prerequisites {
            indegree[prerequisit[0]] += 1
            dict[prerequisit[1], default: []].append(prerequisit[0])
        }

        var queue = [Int]()

        for (index, num) in indegree.enumerated() {
            guard num == 0 else { continue }
            queue.append(index)
        }

        var ans = [Int]()

        while !queue.isEmpty {
            let num = queue.removeFirst()
            ans.append(num)
            guard let courses = dict[num] else { continue }
            for cours in courses {
                indegree[cours] -= 1
                guard indegree[cours] == 0 else { continue }
                queue.append(cours)
            }
        }

        return ans.count == numCourses ? ans : []
    }

}
