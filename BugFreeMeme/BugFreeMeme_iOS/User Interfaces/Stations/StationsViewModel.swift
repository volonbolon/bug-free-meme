//
//  StationsViewModel.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 05/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeKit

public class StationsViewModel: NSObject {
    weak var uxResponder: StationsUXResponder?
    weak var observable: Observable<[Station]>?

    init(observable: Observable<[Station]>) {
        self.observable = observable
    }
}
