//
//  KeyMetrics.swift
//  Stock List
//
//  Created by Luis Madriz on 4/29/22.
//

import Foundation

struct KeyMetrics: Codable {
    let symbol: String
    let date: String
    let returnOnAssets: Double
    let returnOnEquity: Double
    let priceEarningsRatio: Double
    let priceEarningsToGrowthRatio: Double
    let debtRatio: Double
}
