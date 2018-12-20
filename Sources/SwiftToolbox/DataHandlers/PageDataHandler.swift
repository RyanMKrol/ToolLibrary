//
//  PageDataHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  TV: Peep Show - Season 3 - Episode 1

import Foundation
import SwiftSoup

public protocol PageDataHandler: DataHandler {
    func parseHtml(htmlDoc: Document) throws -> processedData
}

public extension PageDataHandler {

    private func parseToHtml(data: Data) throws -> Document {

        guard let pageData = String(data: data, encoding: .utf8) else {
            throw CommonErrors.BadPageData
        }

        let parsedHtml = try SwiftSoup.parse(pageData)

        return parsedHtml
    }

    func parseData(data: Data) throws -> processedData {
        return try parseHtml(
            htmlDoc: try parseToHtml(data: data)
        )
    }

}
