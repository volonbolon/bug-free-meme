//
//  BugFreeMemeAppDependencyContainer.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import BugFreeMemeUIKit

public struct BugFreeMemeAppDependencyContainer {
    public init() {}

    public func makeRootViewController() -> RootViewController {
        let mainViewController = self.makeMainViewController()
        let viewController = RootViewController(mainViewController: mainViewController)

        return viewController
    }

    public func makeMainViewController() -> MainViewController {
        let userInterface = MainRootView(frame: .zero)
        let viewController = MainViewController(userInterface: userInterface)
        return viewController
    }
}
