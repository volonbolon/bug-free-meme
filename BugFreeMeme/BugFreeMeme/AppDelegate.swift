//
//  AppDelegate.swift
//  BugFreeMeme
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMeme_iOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let injectionContainer = BugFreeMemeAppDependencyContainer()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        self.window = window

        self.setupMainViewController()

        return true
    }
}

extension AppDelegate { // MARK: Helpers
    fileprivate func setupMainViewController() {
        let rootViewController = injectionContainer.makeRootViewController()
        self.setUpWindow(withRootViewController: rootViewController)
    }

    private func setUpWindow(withRootViewController rootViewController: UIViewController) {
        guard let window = self.window else {
            fatalError("Unable to attach the window")
        }
        window.frame = UIScreen.main.bounds
        window.makeKeyAndVisible()
        window.rootViewController = rootViewController
    }
}
