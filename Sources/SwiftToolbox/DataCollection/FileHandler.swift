//
//  FileHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  TV: Peep Show - Season 2 - Episode 4

import Foundation

public class FileHandler {

    enum FileErrors: Error {
        case CouldNotRead
        case CouldNotWrite
        case CouldNotCreate
    }

    private init(){}

    private static let fileManager = FileManager.default

    public static func fetch(fileLoc: String) throws -> Set<String> {

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(fileLoc)
            do {
                let savedLinks = try String(contentsOf: fileURL, encoding: .utf8)
                let urls = savedLinks.split(separator: "\n")

                return Set<String>(urls.map {String($0)})
            } catch {
                throw FileErrors.CouldNotRead
            }
        }

        throw FileErrors.CouldNotRead
    }

    public static func push(urls:String, fileLoc: String) throws {

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(fileLoc)

            if (!fileManager.fileExists(atPath:fileURL.path)){
                if (!fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)){
                    throw FileErrors.CouldNotCreate
                }
            }
            do {
                try urls.write(to: fileURL, atomically: true, encoding: .utf8)
            }
            catch {
                throw FileErrors.CouldNotWrite
            }
        }
    }
}

