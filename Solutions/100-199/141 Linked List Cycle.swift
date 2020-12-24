//
//  141 Linked List Cycle.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 24/12/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/linked-list-cycle/
class Solution {

    /// Finds if the linked list has a cycle.
    ///
    /// - Parameter head: The linked list head.
    /// - Returns: True if a cycle exists, otherwise returns false.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        
        while slow != nil, fast != nil {
            guard slow !== fast else { return true }
            
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }

}

/// Provided code
public class ListNode {

    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

}
