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
    private func getNetworksData() -> Data? {
        var data: Data? = nil
        if let bundle = Bundle(identifier: "Volonbolon.BugFreeMemeKit"),
            let url = bundle.url(forResource: "networks", withExtension: "json") {
            do {
                data = try Data(contentsOf: url)
            } catch {
                print(error)
            }
        }
        return data
    }

    fileprivate var networks: [Network] {
        var networks: [Network] = []
        if let data = self.getNetworksData() {
            do {
                let jsonDecoder = JSONDecoder()
                let decodedNetworks = try jsonDecoder.decode(DecodableNetworks.self, from: data)
                networks = decodedNetworks.networks
            } catch {
                print(error)
            }
        }
        return networks
    }

    fileprivate var stations: [Station] {
        let station1 = Station(id: "9085f76f243f303704f1ed3e87e16e85",
                               emptySlots: 99,
                               freeBikes: 198,
                               latitude: -23.5563617,
                               longitude: -46.6625619,
                               name: "teste ecobici - 450")
        let station2 = Station(id: "4d5ee2421ad3536074c4ae38bc890be5",
                               emptySlots: 99,
                               freeBikes: 198,
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
