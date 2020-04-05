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

    public init(userInterface: StationsView,
                network: Network) {
        self.userInterface = userInterface
        self.network = network

        super.init()
    }

    override public func loadView() {
        super.loadView()
        self.view = userInterface
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.network.id
    }
}
