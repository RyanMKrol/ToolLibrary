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

     - parameter dataHandler: Request object that specifies the URL, and response processing

     - returns: The result of the API call, parsed by the dataHandler processor
     - throws: Any exceptions related to gathering and parsing the data
     */
    public static func fetch<T: DataHandler>(
        dataHandler: T
    ) throws -> T.processedData {

        var data: Data? = nil
        var error: Error? = nil

        InteractionHandler.download(url: dataHandler.url) { (result: Result) in
            switch result {
            case .success(let callbackResult):
                data = callbackResult
            case .failure(let callbackError):
                error = callbackError
            }
        }

        if let error = error {
            throw error
        }

        guard let concreteData = data else {
            throw CommonErrors.NoData
        }

        return try dataHandler.parseData(data: concreteData)
    }

    /**
     Responsible for downloading data

     - parameter url: The location of the data we want to grab
     - parameter completion: The callback to handle the data coming back
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
