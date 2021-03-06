//
//  StationsUXResponder.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 05/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation
import BugFreeMemeKit

protocol StationsUXResponder: class {
    var observable: Observable<[Station]> { get }
    func loadStations()
    func goToStationDetails(_ station: Station)
}
