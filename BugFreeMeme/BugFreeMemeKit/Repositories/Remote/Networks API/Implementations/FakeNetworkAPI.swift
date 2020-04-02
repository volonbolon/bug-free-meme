//
//  FakeNetworkAPI.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct FakeNetworkAPI: NetworkAPI {
    public func getNetworks(completionHandler: @escaping NetworkAPICompletionHandlerForArray) {
        let location = Location(city: "Buenos Aires",
                                country: "AR",
                                latitude: -34.630665,
                                longitude: -58.41156)
        let network = Network(id: "ecobici-buenos-aires",
                              location: location)
        let result = Either<NetworkAPIError, [Network]>.Right([network])
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completionHandler(result)
        }
    }
}
