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

public typealias NetworkAPICompletionHandlerForArray = (Either<NetworkAPIError, [Network]>) -> Void

public protocol NetworkAPI {
    func getNetworks(completionHandler: @escaping NetworkAPICompletionHandlerForArray)
}
