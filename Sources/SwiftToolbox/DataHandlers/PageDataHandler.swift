//
//  PageDataHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  TV: Peep Show - Season 3 - Episode 1

import Foundation
import SwiftSoup

public protocol PageDataHandler: DataHandler where processedData == Document {
    func parseHtml(data: processedData) -> Document
}

extension PageDataHandler {

    func parseHtml(data: Data) -> processedData {
        let pageData = String.init(data: data, encoding: .utf8)!
        let parsedHtml = try! SwiftSoup.parse(pageData)

        return parsedHtml
    }

}
