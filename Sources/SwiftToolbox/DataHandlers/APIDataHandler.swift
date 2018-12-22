//
//  APIDataHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  Song: No Interruption - Hoodie Allen

import Foundation

public class APIDataHandler<T: Decodable>: DataHandler {

    public typealias processedData = T

    public var url: URL

    public init(url: URL) {
        self.url = url
    }

    public func parseData(data: Data) throws -> processedData {
        return try JSONDecoder().decode(
            processedData.self,
            from: data
        )
    }
}
