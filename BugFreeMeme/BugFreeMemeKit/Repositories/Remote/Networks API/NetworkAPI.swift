//
//  NetworkAPI.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public enum NetworkAPIError: Error {
    case connectionError
    case parsingError
}

public typealias GetNetworksCompletionHandler = (Either<NetworkAPIError, [Network]>) -> Void
public typealias GetStationsCompletionHandler = (Either<NetworkAPIError, [Station]>) -> Void

public protocol NetworkAPI {
    func getNetworks(completionHandler: @escaping GetNetworksCompletionHandler)
    func getNetworkStations(completionHandler: @escaping GetStationsCompletionHandler)
}
