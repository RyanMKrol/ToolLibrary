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

    /**
     Responsible for parsing raw data into the data type we want

     - parameter data: The raw data

     - throws: When the data cannot be processed/parsed properly
     - returns: Data in the final type we want
     */
    func parseData(data: Data) throws -> processedData
}
