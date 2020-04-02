//
//  Network.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct Network: Equatable, Codable {
    public let id: String
    public let location: Location
}

extension Network: CustomStringConvertible {
    public var description: String {
        return "\(self.id)"
    }
}
