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
    public func getNetworks(completionHandler: @escaping GetNetworksCompletionHandler) {
        let networks = self.networks
        let result = Either<NetworkAPIError, [Network]>.Right(networks)
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completionHandler(result)
        }
    }

    public func getNetworkStations(completionHandler: @escaping GetStationsCompletionHandler) {
        let stations = self.stations
        let result = Either<NetworkAPIError, [Station]>.Right(stations)
        let deadline = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completionHandler(result)
        }
    }
}

extension FakeNetworkAPI { // MARK: Fake loaders
    fileprivate var networks: [Network] {
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

    fileprivate var stations: [Station] {
        let station1 = Station(id: "9085f76f243f303704f1ed3e87e16e85",
                               empty_slots: 99,
                              free_bikes: 198,
                              latitude: -23.5563617,
                              longitude: -46.6625619,
                              name: "teste ecobici - 450")
        let station2 = Station(id: "4d5ee2421ad3536074c4ae38bc890be5",
                               empty_slots: 99,
                              free_bikes: 198,
                              latitude: 45.5568536,
                              longitude: -73.4941693,
                              name: "teste ecobici - 451")
        let stations = [
            station1,
            station2
        ]
        return stations
    }
}
