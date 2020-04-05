//
//  BugFreeMemeAppDependencyContainer.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import BugFreeMemeUIKit
import BugFreeMemeKit

public struct BugFreeMemeAppDependencyContainer {
    public init() {}

    public func makeRemoteAPI() -> NetworkAPI {
        return FakeNetworkAPI()
    }

    public func makeRootViewController() -> RootViewController {
        let mainViewController = self.makeMainViewController()
        let viewController = RootViewController(mainViewController: mainViewController)

        return viewController
    }

    public func makeMainViewController() -> MainViewController {
        let observable = Observable<[Network]>([])
        let viewModel = MainRootViewModel(observable: observable)
        let userInterface = MainRootView(viewModel: viewModel)
        let viewController = MainViewController(userInterface: userInterface,
                                                refreshNetworksUseCaseFactory: self,
                                                observable: observable)
        viewModel.uxResponder = viewController
        return viewController
    }
}

extension BugFreeMemeAppDependencyContainer: RefreshNetworksUseCaseFactory {
    public func makeRefreshNetworksUseCase(observable: Observable<[Network]>) -> UseCase {
        let networkAPI = self.makeRemoteAPI()
        let useCase = RefreshNetworksUseCase(remoteAPI: networkAPI,
                                             observable: observable)
        return useCase
    }
}
