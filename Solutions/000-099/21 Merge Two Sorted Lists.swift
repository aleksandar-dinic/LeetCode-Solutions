//
//  21 Merge Two Sorted Lists.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 04/01/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/merge-two-sorted-lists/
class Solution {

    /// Merges two sorted linked lists.
    ///
    /// - Parameters:
    ///   - l1: A sorted linked list.
    ///   - l2: A sorted linked list.
    /// - Returns: The sorted linked list made by splicing together the nodes from
    ///   the `l1` and `l2`.
    ///
    /// - Complexity:
    ///   - time: O(n + m), where n is the number of nodes in `l1`, and m is the
    ///   number of nodes in `l2`.
    ///   - space: O(1), only constant space is used.
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }

        var l1 = l1
        var l2 = l2
        
        let dummy = ListNode(-1)
        var curr: ListNode? = dummy
        
        while let l1Val = l1?.val, let l2Val = l2?.val {
            if l1Val < l2Val {
                curr?.next = l1
                l1 = l1?.next
            } else {
                curr?.next = l2
                l2 = l2?.next
            }
            
            curr = curr?.next
        }
        curr?.next = l1 != nil ? l1 : l2
        
        return dummy.next
    }

}

/// Provided code
public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }

}
