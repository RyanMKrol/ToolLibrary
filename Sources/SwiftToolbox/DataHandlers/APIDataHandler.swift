//
//  APIDataHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  Song: No Interruption - Hoodie Allen

import Foundation

public protocol APIDataHandler: DataHandler where processedData: Decodable {
    func parseCodable(data: Data) -> processedData
}

extension APIDataHandler {
    mutating func parseData(data: Data) throws -> processedData {
        return try JSONDecoder().decode(
            processedData.self,
            from: data
        )
    }
}
