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

    public static func appendWithNewline(_ source: inout String, newContent: String) {
        source.append(newContent)
        source.append("\n")
    }

}

