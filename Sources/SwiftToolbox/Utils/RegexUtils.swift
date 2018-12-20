//
//  RegexUtils.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  Song: Closer - Kings of Leon

import Foundation

public class RegexUtils {

    private init(){}

    /**
     Gets the number of matches for a regex pattern against a string

     - Parameter pattern: The regex pattern
     - Parameter target: The string to evaluate the regex against

     - returns: The number of matches
     */
    public static func numMatches(pattern: String, target: String) -> Int {
        let regex = try? NSRegularExpression(
            pattern: pattern,
            options: []
        )
        let matches = regex?.numberOfMatches(
            in: target,
            options: [],
            range: NSRange(location: 0, length: target.count)
            ) ?? 0

        return matches
    }

    /**
     Tells you if the pattern is found within your string

     - Parameter pattern: The regex pattern
     - Parameter target: The string to evaluate the regex against

     - returns: Whether the target matches the pattern
     */
    public static func matches(pattern: String, target: String) -> Bool {
        return numMatches(pattern: pattern, target: target) > 0
    }

}
