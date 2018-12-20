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
    func parseDataInternal(htmlDoc: Document) -> processedData
}

public extension PageDataHandler {

    func parseHtml(data: Data) -> Document {
        let pageData = String.init(data: data, encoding: .utf8)!
        let parsedHtml = try! SwiftSoup.parse(pageData)

        return parsedHtml
    }

    func parseData(data: Data) throws -> processedData {
        return parseDataInternal(
            htmlDoc: parseHtml(data: data)
        )
    }

}
