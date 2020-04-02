//
//  RootViewController.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeUIKit

public class RootViewController: NiblessNavigationController {
    let mainViewController: MainViewController

    init(mainViewController: MainViewController) {
        self.mainViewController = mainViewController

        super.init()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.pushViewController(self.mainViewController,
                                animated: false)
    }
}
