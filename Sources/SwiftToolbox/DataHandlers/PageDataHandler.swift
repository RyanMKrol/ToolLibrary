//
//  PageDataHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  TV: Peep Show - Season 3 - Episode 1

import Foundation

import class SwiftSoup.Document
import func SwiftSoup.parse

public protocol PageDataHandler: DataHandler {
    func parseHtml(htmlDoc: Document) throws -> processedData
}

public extension PageDataHandler {

    /**
     Responsible for parsing HTML from data representing a DOM

     - parameter data: The page data

     - throws: When the data cannot be parsed into HTML
     - returns: The HTML document
     */
    private func parseToHtml(data: Data) throws -> Document {

        guard let pageData = String(data: data, encoding: .utf8) else {
            throw CommonErrors.BadPageData
        }

        let parsedHtml = try SwiftSoup.parse(pageData)

        return parsedHtml
    }

    /**
     Responsible for parsing the raw response into the data type we want

     - parameter data: The page data

     - throws: When the data cannot be parsed into HTML, or into our target data type
     - returns: Data in the final response type we want
     */
    func parseData(data: Data) throws -> processedData {
        return try parseHtml(
            htmlDoc: try parseToHtml(data: data)
        )
    }

}
