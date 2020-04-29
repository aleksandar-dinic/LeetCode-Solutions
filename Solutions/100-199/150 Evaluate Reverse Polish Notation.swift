//
//  150 Evaluate Reverse Polish Notation.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 29/04/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/evaluate-reverse-polish-notation/
class Solution {

    /// Evaluates the value of an arithmetic expression in Reverse Polish Notation.
    ///
    /// - Parameter tokens: Array of tokens.
    ///
    /// - Returns: Value of arithmetic expression.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the length of the tokens.
    ///   - space: O(n), where n is the length of the tokens.
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()

        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
                continue
            }

            guard stack.count >= 2 else { fatalError("RPN expression isn't valid.") }

            let sec = stack.removeLast()
            let fir = stack.removeLast()

            switch token {
            case "+": stack.append(fir + sec)
            case "-": stack.append(fir - sec)
            case "*": stack.append(fir * sec)
            case "/": stack.append(fir / sec)
            default:
                fatalError("RPN expression isn't valid.")
            }

        }

        guard stack.count == 1 else { fatalError("RPN expression isn't valid.") }

        return stack[0]
    }

}
