//
//  478 Generate Random Point in a Circle.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 17/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/generate-random-point-in-a-circle/
class Solution {
    
    private let radius: Double
    private let xCenter: Double
    private let yCenter: Double
    
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        xCenter = x_center
        yCenter = y_center
    }
    
    /// Generates random point in a circle.
    ///
    /// - Returns: The random point in a circle.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func randPoint() -> [Double] {
        let randomR = Double.random(in: 0.0...1.0).squareRoot() * radius
        let randomTheta = Double.random(in: 0.0...1.0) * 2 * Double.pi
        let newX = xCenter + randomR * cos(randomTheta)
        let newY = yCenter + randomR * sin(randomTheta)
        return [newX, newY]
    }

}
