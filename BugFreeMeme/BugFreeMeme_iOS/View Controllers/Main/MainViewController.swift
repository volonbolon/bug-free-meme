//
//  MainViewController.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeUIKit

open class MainViewController: NiblessViewController {
    let userInterface: MainRootView

    init(userInterface: MainRootView) {
        self.userInterface = userInterface

        super.init()
    }

    open override func loadView() {
        super.loadView()

        self.view = userInterface
    }
}
