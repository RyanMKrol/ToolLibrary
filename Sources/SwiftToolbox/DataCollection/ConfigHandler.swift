//
//  ConfigHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 22/12/2018.
//
//  Song: STARGAZING - Travis Scott

import Foundation
import Configuration
import SwiftyJSON

public class ConfigLoader<T: Decodable> {

    private let topLevelConfigKey: String = "config"
    private let configFile: String

    public init(configFile: String){
        self.configFile = configFile
    }

    /**
     Loads a config file

     - returns: The application configuration
     */
    public func loadAppConfig() throws -> T {
        let manager = ConfigurationManager().load(configFile)

        guard let appConfig = manager[topLevelConfigKey] else {
            throw CommonErrors.CouldNotLoadAppConfig
        }

        let jsonConfig = JSON(appConfig)
        let jsonData = try jsonConfig.rawData()
        let config = try JSONDecoder().decode(T.self, from: jsonData)

        return config
    }
}
