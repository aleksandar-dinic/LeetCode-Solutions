//
//  380 Insert Delete GetRandom O(1).swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 12/06/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/insert-delete-getrandom-o1/
class RandomizedSet {

    private var arr: [Int]
    private var dict: [Int: Int]

    /// Initialize data structure.
    init() {
        arr = [Int]()
        dict = [Int: Int]()
    }

    /// Inserts a value to the set.
    ///
    /// - Parameter val: The value.
    /// - Returns: True if the set did not already contain the specified element, otherwise
    ///   returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func insert(_ val: Int) -> Bool {
        guard dict[val] == nil else { return false }
        arr.append(val)
        dict[val] = arr.count - 1
        return true
    }

    /// Removes a value from the set.
    ///
    /// - Parameter val: The value
    /// - Returns: True if the set contained the specified element, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func remove(_ val: Int) -> Bool {
        guard let indexToRemove = dict[val], let last = arr.last else { return false }

        arr[indexToRemove] = last
        arr.removeLast()

        dict[last] = indexToRemove
        dict[val] = nil
        return true
    }

    /// Get a random element from the set.
    ///
    /// - Returns: Random element.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func getRandom() -> Int {
        return arr[Int.random(in: 0..<arr.count)]
    }

}
