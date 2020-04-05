//
//  Target.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 03/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public class Target {
    public var onValueChanged: (() -> Void)?
    @objc public func valueChanged() {
        onValueChanged?()
    }

    public init() {}
}
