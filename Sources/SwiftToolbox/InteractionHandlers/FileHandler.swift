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

    /**
     Responsible for reading newline separated strings from a file

     - parameter fileLoc: The location of the file being read

     - returns: A set of newline separated strings
     - throws: Any exceptions related to reading the file
     */
    public static func readLines(fileLoc: String) throws -> Set<String> {

        let fileUrl = NSURL.fileURL(withPath: fileLoc)

        do {
            let savedLinks = try String(contentsOf: fileUrl, encoding: .utf8)
            let urls = savedLinks.split(separator: "\n")

            return Set<String>(urls.map {String($0)})
        } catch {
            throw FileErrors.CouldNotRead
        }
    }

    /**
     Responsible for writing content to a file

     - parameter content: The content being written to the file
     - parameter fileLoc: The location of the file being written to

     - throws: Any exceptions related to writing to the file
     */
    public static func pushString(content:String, fileLoc: String) throws {

        if (!fileManager.fileExists(atPath:fileLoc)){
            if (!fileManager.createFile(atPath: fileLoc, contents: nil, attributes: nil)){
                throw FileErrors.CouldNotCreate
            }
        }
        do {
            let fileUrl = NSURL.fileURL(withPath: fileLoc)

            try content.write(to: fileUrl, atomically: true, encoding: .utf8)
        }
        catch {
            throw FileErrors.CouldNotWrite
        }
    }

    /**
     Responsible for checking if a file exists

     - parameter fileLoc: The location of the file

     - returns: Whether the file exists
     */
    public static func fileExists(fileLoc: String) -> Bool {
        return fileManager.fileExists(atPath:fileLoc)
    }
}

