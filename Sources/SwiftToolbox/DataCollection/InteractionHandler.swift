//
//  InteractionHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 20/12/2018.
//
//  TV: Peep Show - Season 3 - Episode 1

import Foundation

public class InteractionHandler {

    /**
     A wrapper for downloading data, and the processing the result

     - parameter processor: The callback to handle the data coming back
     - parameter url: The location of the data we want to grab

     - returns: Whatever the callback returns
     - throws: Any exceptions related to gathering and parsing the data
     */
    public static func fetch<T: DataHandler>(
        dataHandler: inout T
    ) throws -> T {

        var dataContainer = dataHandler
        var error: Error? = nil

        InteractionHandler.download(url: dataHandler.url) { (result: Result) in
            switch result {
            case .success(let callbackResult):
                dataContainer.result = try? dataContainer.parseData(data: callbackResult)
            case .failure(let callbackError):
                error = callbackError
            }
        }

        if let error = error {
            throw error
        }

        guard let _ = dataContainer.getData() else {
            throw APIErrors.NoData
        }

        return dataContainer
    }

    /**
     Responsible for downloading data

     - parameter completion: The callback to handle the data coming back
     - parameter url: The location of the data we want to grab
     */
    private static func download(
        url: URL,
        completion: @escaping (Result<Data>) -> Void
    ) {
        let waitTask = DispatchSemaphore(value: 0)

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            defer { waitTask.signal() }

            completion(Result {

                guard let data = data else {
                    throw APIErrors.NoData
                }

                return data
            })
        }.resume()

        waitTask.wait()
    }

}
