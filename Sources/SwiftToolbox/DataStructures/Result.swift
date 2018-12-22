//
//  Result.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 19/12/2018.
//
//  TV: Peep Show - Season 1 - Episode 3

import Foundation

public enum Result<T> {
    case success(T), failure(Error)
}

public extension Result {

    /**
     Result initialiser, will create either a failing or successful result

     - parameter throwingExpr: A function to execute that will either return or throw
     */
    init(throwingExpr: () throws -> T) {
        do {
            let value = try throwingExpr()
            self = Result.success(value)
        } catch {
            self = Result.failure(error)
        }
    }
}
