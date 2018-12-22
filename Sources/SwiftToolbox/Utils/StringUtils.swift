//
//  StringUtils.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  Song: Sex on Fire - Kings of Leon

import Foundation

public class StringUtils {

    private init(){}

    /**
     Appends content to a string with a newline

     - parameter source: The source string
     - parameter newContent: The new content to put in the string
     */
    public static func appendWithNewline(_ source: inout String, newContent: String) {
        source.append(newContent)
        source.append("\n")
    }

}

