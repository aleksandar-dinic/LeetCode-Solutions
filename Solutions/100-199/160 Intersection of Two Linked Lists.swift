//
//  160 Intersection of Two Linked Lists.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 23/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/intersection-of-two-linked-lists/
class Solution {

    /// Finds the node at which the two lists intersect.
    ///
    /// - Parameters:
    ///   - headA: Linked list head.
    ///   - headB: Linked list head.
    /// - Returns: The node at which the two lists intersect.
    ///
    /// - Complexity:
    ///   - time: O(n + m), where n is the length of the list `A`, and m is the
    ///   length of list `B`.
    ///   - space: O(1), only constant space is used.
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil, headB != nil else { return nil }
        
        var a: ListNode? = headA
        var b: ListNode? = headB
        
        while a !== b {
            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next
        }
        
        return a
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
