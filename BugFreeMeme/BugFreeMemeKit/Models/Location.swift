//
//  Location.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct Location: Equatable, Codable {
    public let city: String
    public let country: String
    public let latitude: Double
    public let longitude: Double
}

extension Location: CustomStringConvertible {
    public var description: String {
        return "\(self.city) - \(self.country)"
    }
}
