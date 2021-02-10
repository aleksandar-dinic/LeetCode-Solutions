//
//  138 Copy List with Random Pointer.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 10/02/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/copy-list-with-random-pointer/
class Solution {

    /// Constructs a deep copy of the list.
    ///
    /// - Parameter head: Linked list head.
    /// - Returns: The head of the copied linked list.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of nodes in the linked list.
    ///   - space: O(1), only constant space is used.
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        
        var cur: Node? = head
        while let val = cur?.val {
            var newNode = Node(val)
            newNode.next = cur?.next
            cur?.next = newNode
            cur = newNode.next
        }
        
        cur = head
        while cur != nil {
            cur?.next?.random = cur?.random?.next
            cur = cur?.next?.next
        }
        
        var oldList: Node? = head
        var newList = head.next
        let headOld = head.next
        while oldList != nil {
            oldList?.next = oldList?.next?.next
            newList?.next = newList?.next?.next
            oldList = oldList?.next
            newList = newList?.next
        }
        return headOld
    }

}

/// Provided code
public class Node {
    
    public var val: Int
    public var next: Node?
    public var random: Node?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
    
}
