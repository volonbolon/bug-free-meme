//
//  MainViewController.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeUIKit
import BugFreeMemeKit

open class MainViewController: NiblessViewController {
    let userInterface: MainRootView
    let refreshNetworksUseCaseFactory: RefreshNetworksUseCaseFactory
    let observable: Observable<[Network]>
    var useCase: UseCase?

    init(userInterface: MainRootView,
         refreshNetworksUseCaseFactory: RefreshNetworksUseCaseFactory,
         observable: Observable<[Network]>) {
        self.userInterface = userInterface
        self.refreshNetworksUseCaseFactory = refreshNetworksUseCaseFactory
        self.observable = observable

        super.init()
    }

    open override func loadView() {
        super.loadView()

        self.view = userInterface
    }
}

extension MainViewController { // MARK: Helpers
}

extension MainViewController: MainUXResponder {
    func refreshNetworks() {
        let factory = self.refreshNetworksUseCaseFactory
        let useCase = factory.makeRefreshNetworksUseCase(observable: self.observable)
        self.useCase = useCase
        useCase.start()
    }
}
