//
//  StockData.swift
//  Stock List
//
//  Created by Luis Madriz on 4/25/22.
//

import Foundation

struct StockList: Codable {
    let symbol: String
    let name: String
    let price: Double
    let exchange: String
    let type: String
    
}
