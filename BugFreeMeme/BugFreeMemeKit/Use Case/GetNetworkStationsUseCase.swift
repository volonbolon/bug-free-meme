//
//  GetNetworkStationsUseCase.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 05/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public class GetNetworkStationsUseCase: UseCase {
    let networkId: String
    let remoteAPI: NetworkAPI
    let observable: Observable<[Station]>

    public init(remoteAPI: NetworkAPI,
                networkId: String,
                observable: Observable<[Station]>) {
        self.networkId = networkId
        self.remoteAPI = remoteAPI
        self.observable = observable
    }

    public func start() {
        self.remoteAPI.getNetworkStations { result in
            switch result {
            case .Left(let error):
                print(error)
            case .Right(let stations):
                self.observable.value = stations
            }
        }
    }
}

public protocol GetNetworkStationsUseCaseFactory {
    func makeShowNetworkDetailsUseCase() -> UseCase
}
