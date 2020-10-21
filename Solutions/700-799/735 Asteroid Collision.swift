//
//  735 Asteroid Collision.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 21/10/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/asteroid-collision/
class Solution {

    /// Finds out the state of the asteroids after all collisions.
    ///
    /// - Parameter asteroids: An array of asteroids.
    /// - Returns: The state of the asteroids after all collisions.
    ///
    /// - Complexity:
    ///     - time: O(n), where n is the number of asteroids.
    ///     - space: O(n), where n is the number of asteroids.
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var ans = [Int]()

        for asteroid in asteroids {
            guard asteroid < 0 else {
                ans.append(asteroid)
                continue
            }

            while let last = ans.last, last > 0, last < abs(asteroid) {
                ans.removeLast()
            }

            if let last = ans.last, last == abs(asteroid) {
                ans.removeLast()
            } else if ans.isEmpty || ans.last ?? Int.max < 0 {
                ans.append(asteroid)
            }
        }

        return ans
    }

}
