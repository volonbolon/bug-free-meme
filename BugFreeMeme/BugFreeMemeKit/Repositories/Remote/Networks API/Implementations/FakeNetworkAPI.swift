//
//  FakeNetworkAPI.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct FakeNetworkAPI: NetworkAPI {
    public init() {}
    public func getNetworks(completionHandler: @escaping NetworkAPICompletionHandlerForArray) {
        let networks = self.networks()
        let result = Either<NetworkAPIError, [Network]>.Right(networks)
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completionHandler(result)
        }
    }

    private func networks() -> [Network] {
        let bueLocation = Location(city: "Buenos Aires",
                                country: "AR",
                                latitude: -34.630665,
                                longitude: -58.41156)
        let networkBue = Network(id: "ecobici-buenos-aires",
                              location: bueLocation)

        let rosLocation = Location(city: "Rosario",
                                country: "AR",
                                latitude: -32.95,
                                longitude: -60.65)
        let networkRos = Network(id: "mibicitubici",
                              location: rosLocation)

        let networks = [
            networkBue,
            networkRos
        ]

        return networks
    }
}
