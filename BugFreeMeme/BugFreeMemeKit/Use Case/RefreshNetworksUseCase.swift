//
//  RefreshNetworksUseCase.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 03/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public class RefreshNetworksUseCase: UseCase {
    let remoteAPI: NetworkAPI
    let observable: Observable<[Network]>

    public init(remoteAPI: NetworkAPI,
                observable: Observable<[Network]>) {
        self.remoteAPI = remoteAPI
        self.observable = observable
    }

    public func start() {
        self.remoteAPI.getNetworks { result in
            switch result {
            case .Left(let error):
                print(error)
            case .Right(let networks):
                self.observable.value = networks
            }
        }
    }
}

public protocol RefreshNetworksUseCaseFactory {
    func makeRefreshNetworksUseCase(observable: Observable<[Network]>) -> UseCase
}
