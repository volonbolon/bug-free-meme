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
    public let empty_slots: Int
    public let free_bikes: Int
    public let latitude: Double
    public let longitude: Double
    public let name: String
}

extension Station: CustomStringConvertible {
    public var description: String {
        return "\(self.name): Free Bikes: \(self.free_bikes) | Empty Slots: \(self.empty_slots)"
    }
}
