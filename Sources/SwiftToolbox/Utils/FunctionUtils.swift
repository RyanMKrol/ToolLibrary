//
//  FunctionUtils.swift
//  SwiftToolbox
//
//  Created by Samantha on 24/12/2018.
//
//  TV: Peep Show - Season 8 - Episode 3

import Foundation

public class FunctionUtils {

    private init() {}

    /**
     For use with functions that you expect to fail on occasion. This could be
     because of API limits when you want the program to continue running.

     - parameter retries: The number of retries the function can go through before stopping
     - parameter retryWaitTime: The time the function will wait before trying again
     - parameter function: The function to call a number of times

     - returns: The result of the function we're calling
     - throws: When the function fails to complete after retrying a number of times

     - note: Only for use with time insensitive systems, this will make everything slow
             right down
     - warning: Not for use on functions you don't expect to fail. If you send a malformed
             request to this function, it will retry on any throwing result, not specifically
             for timeouts, meaning your faiing function will take much longer to finish.
    */
    public static func callWithRetry<T>(
        retries: Int = 10,
        retryWaitTime: Int = 5,
        function: () throws -> T
    ) throws -> T {

        if retries == 0 {
            throw CommonErrors.CouldNotResolveFunction
        }

        do {
            return try function()
        } catch {
            sleep(UInt32(retryWaitTime))

            return try callWithRetry(
                retries: retries - 1,
                retryWaitTime: retryWaitTime,
                function: function
            )
        }

    }
}
