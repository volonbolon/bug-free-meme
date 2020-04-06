//
//  Station.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public struct Station: Equatable, Codable {
    public let id: String
    public let emptySlots: Int
    public let freeBikes: Int
    public let latitude: Double
    public let longitude: Double
    public let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case emptySlots = "empty_slots"
        case freeBikes = "free_bikes"
        case latitude
        case longitude
        case name
    }
}

extension Station: CustomStringConvertible {
    public var description: String {
        return "\(self.name): Free Bikes: \(self.freeBikes) | Empty Slots: \(self.emptySlots)"
    }
}
