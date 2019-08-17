//
//  ConfigHandler.swift
//  SwiftToolbox
//
//  Created by Ryan Krol on 22/12/2018.
//
//  Song: STARGAZING - Travis Scott

import Foundation

import class Configuration.ConfigurationManager
import struct SwiftyJSON.JSON

public class ConfigHandler<T: Decodable> {

    private let topLevelConfigKey: String = "config"
    private let configFile: String
    private let relativeFrom: String?

    /**
     Config Handler initialiser

     - parameter configFile: the file to load the config from
     */
    public init(configFile: String, relativeFrom: String? = nil){
        self.configFile = configFile
        self.relativeFrom = relativeFrom
    }

    /**
     Loads a config file

     - returns: The application configuration
     - throws: When we fail to load the application file
     */
    public func load() throws -> T {
        let manager = self.relativeFrom != nil
            ? ConfigurationManager().load(file: configFile, relativeFrom: .customPath(self.relativeFrom!))
            : ConfigurationManager().load(file: configFile)


        guard let appConfig = manager[topLevelConfigKey] else {
            throw CommonErrors.CouldNotLoadAppConfig
        }

        let jsonConfig = JSON(appConfig)
        let jsonData = try jsonConfig.rawData()
        let config = try JSONDecoder().decode(T.self, from: jsonData)

        return config
    }
}
