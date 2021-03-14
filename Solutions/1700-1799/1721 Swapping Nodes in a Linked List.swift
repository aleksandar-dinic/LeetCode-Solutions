//
//  1721 Swapping Nodes in a Linked List.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 14/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/swapping-nodes-in-a-linked-list/
class Solution {

    /// Swaps nodes in a linked list.
    ///
    /// - Parameters:
    ///   - head: Linked list head.
    ///   - k: An integer.
    /// - Returns: Linked list head.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the list.
    ///   - space: O(1), only constant space is used.
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var listLength = 0
        var frontNode: ListNode? = nil
        var endNode: ListNode? = nil
        var currentNode = head
        
        while currentNode != nil {
            listLength += 1
            if endNode != nil {
                endNode = endNode?.next
            }
            
            if listLength == k {
                frontNode = currentNode
                endNode = head
            }
            
            currentNode = currentNode?.next
        }
        
        guard let frontVal = frontNode?.val,
                let endVal = endNode?.val
        else { return head }
        
        frontNode?.val = endVal
        endNode?.val = frontVal
        
        return head
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
