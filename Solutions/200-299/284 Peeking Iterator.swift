//
//  284 Peeking Iterator.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 08/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/peeking-iterator/
class PeekingIterator {
    
    private var iterator: IndexingIterator<Array<Int>>
    private var nextVal: Int?
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        iterator = arr
        nextVal = iterator.next()
    }
    
    /// Finds the next item in the sequence.
    ///
    /// - Returns: The next item.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func next() -> Int {
        let tmp = nextVal
        nextVal = iterator.next()
        return tmp ?? 0
    }
    
    /// Peek the next item.
    ///
    /// - Returns: The next item.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func peek() -> Int {
        nextVal ?? 0
    }
    
    /// Finds whether or not the next item is available.
    ///
    /// - Returns: True if the next item is available, otherwise returns false.
    ///
    /// - Complexity:
    ///     - time: O(1), only constant time is used.
    ///     - space: O(1), only constant space is used.
    func hasNext() -> Bool {
        nextVal != nil
    }
    
}
