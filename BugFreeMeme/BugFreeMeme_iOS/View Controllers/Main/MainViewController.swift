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

public class MainViewController: NiblessViewController {
    let userInterface: MainRootView
    let refreshNetworksUseCaseFactory: RefreshNetworksUseCaseFactory
    let observable: Observable<[Network]>
    var useCase: UseCase?
    let showStationsFactory: (Network) -> StationsViewController

    public init(userInterface: MainRootView,
                refreshNetworksUseCaseFactory: RefreshNetworksUseCaseFactory,
                observable: Observable<[Network]>,
                showStationsFactory: @escaping (Network) -> StationsViewController) {
        self.userInterface = userInterface
        self.refreshNetworksUseCaseFactory = refreshNetworksUseCaseFactory
        self.observable = observable
        self.showStationsFactory = showStationsFactory

        super.init()
    }

    public override func loadView() {
        super.loadView()

        self.view = userInterface
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Networks", comment: "Networks")
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

    func showStations(network: Network) {
        let stationsViewController = self.showStationsFactory(network)
        self.navigationController?.pushViewController(stationsViewController, animated: true)
    }
}
