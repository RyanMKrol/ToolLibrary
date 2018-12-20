//
//  DataHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  TV: Peep Show - Season 3 - Episode 1

import Foundation

public protocol DataHandler {
    associatedtype processedData

    var url: URL { get }
    var result: processedData? { get set }

    mutating func parseData(data: Data) throws
    func getData() -> processedData?
}

extension DataHandler {
    func getData() -> processedData? {
        return self.result
    }
}
