//
//  TimeUtils.swift
//  SwiftToolbox
//
//  Created by Samantha on 24/12/2018.
//
//  TV: Peep Show - Season 8 - Episode 3

import Foundation

public class TimeUtils {

    private init() {}

    public func callWithRetry<T>(
        retries: Int = 10,
        retryWaitTime: Int,
        function: () throws -> T
    ) -> T? {

        if retries == 0 {
            return nil
        }

        do {
            return try function()
        } catch {
            sleep(UInt32(retryWaitTime))

            return callWithRetry(
                retries: retries - 1,
                retryWaitTime: retryWaitTime,
                function: function
            )
        }

    }
}
