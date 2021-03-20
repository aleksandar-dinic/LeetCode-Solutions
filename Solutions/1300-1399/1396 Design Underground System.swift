//
//  1396 Design Underground System.swift
//  LeetCode-Solutions
//
//  Created by Aleksandar Dinic on 20/03/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

/// Source: https://leetcode.com/problems/design-underground-system/
class UndergroundSystem {

    private var checkInData: [Int: (String, Int)]
    private var journeyData: [String: (Double, Double)]

    init() {
        checkInData = [Int: (String, Int)]()
        journeyData = [String: (Double, Double)]()
    }
    
    /// Checks in a passenger at the station.
    ///
    /// - Parameters:
    ///   - id: A passenger ID.
    ///   - stationName: The station name.
    ///   - t: The check in time.
    ///
    /// - Complexity:
    ///   - time: O(n), where n is the number of passengers.
    ///   - space: O(1), only constant space is used.
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        checkInData[id] = (stationName, t)
    }
    
    /// Checks out passengers from the station.
    ///
    /// - Parameters:
    ///   - id: A passenger ID.
    ///   - stationName: The station name.
    ///   - t: The check out time.
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        guard let checkInDataForId = checkInData[id] else {
            return
        }
        let routeKey = stationsKey(checkInDataForId.0, stationName)
        let routeStats = journeyData[routeKey] ?? (0.0, 0.0)
        
        journeyData[routeKey] = (routeStats.0 + Double(t - checkInDataForId.1), routeStats.1 + 1)
        checkInData[id] = nil
    }
    
    /// The average time for traveling from startStation to endStation that happened directly.
    ///
    /// - Parameters:
    ///   - startStation: The start station name.
    ///   - endStation: The end station name.
    /// - Returns: The average time
    ///
    /// - Complexity:
    ///   - time: O(1), only constant time is used.
    ///   - space: O(1), only constant space is used.
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let routeKey = stationsKey(startStation, endStation)
        guard let data = journeyData[routeKey] else {
            return -1
        }
        return data.0 / data.1
    }
    
    private func stationsKey(_ startStation: String, _ endStation: String) -> String {
        "\(startStation) -> \(endStation)"
    }

}
