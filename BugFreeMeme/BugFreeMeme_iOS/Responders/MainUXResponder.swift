//
//  MainUXResponder.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 03/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import BugFreeMemeKit

protocol MainUXResponder: class {
    var observable: Observable<[Network]> { get }
    func refreshNetworks()
}
