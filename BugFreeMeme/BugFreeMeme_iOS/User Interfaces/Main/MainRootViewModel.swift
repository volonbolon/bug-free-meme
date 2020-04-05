//
//  MainRootViewModel.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 03/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import BugFreeMemeKit
import MapKit

public class MainRootViewModel: NSObject {
    weak var uxResponder: MainUXResponder?
    weak var observable: Observable<[Network]>?

    init(observable: Observable<[Network]>) {
        self.observable = observable
    }
}
