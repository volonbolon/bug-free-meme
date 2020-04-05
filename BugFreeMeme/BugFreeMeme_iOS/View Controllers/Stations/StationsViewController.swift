//
//  StationsViewController.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 05/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeKit
import BugFreeMemeUIKit

public class StationsViewController: NiblessViewController {
    let network: Network
    let userInterface: StationsView
    let observable: Observable<[Station]>
    let getNetworkStationsUseCaseFactory: GetNetworkStationsUseCaseFactory

    public init(userInterface: StationsView,
                network: Network,
                observable: Observable<[Station]>,
                getNetworkStationsUseCaseFactory: GetNetworkStationsUseCaseFactory) {
        self.userInterface = userInterface
        self.network = network
        self.observable = observable
        self.getNetworkStationsUseCaseFactory = getNetworkStationsUseCaseFactory

        super.init()
    }

    override public func loadView() {
        super.loadView()
        self.view = userInterface
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.network.id

        self.loadStations()
    }
}

extension StationsViewController: StationsUXResponder {
    func loadStations() {
        let factory = self.getNetworkStationsUseCaseFactory
        let useCase = factory.makeGetNetworkStationsUseCase(networkId: self.network.id,
                                                            observable: self.observable)
        useCase.start()
    }
}
