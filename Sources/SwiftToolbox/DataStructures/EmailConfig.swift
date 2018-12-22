//
//  EmailConfig.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 22/12/2018.
//
//  TV: Peep Show - Season 3 - Episode 6

import Foundation

public struct EmailConfig: Decodable {
    let emailAccount: String
    let emailName: String
    let password: String
    let hostName: String
}

