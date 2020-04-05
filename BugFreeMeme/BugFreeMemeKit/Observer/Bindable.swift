//
//  Bindable.swift
//  BugFreeMemeKit
//
//  Created by Ariel Rodriguez on 03/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import Foundation

public protocol Bindable {
    associatedtype BoundType
    var boundValue: BoundType { get set }
}

private var BindableKey: UInt8 = 0
extension Bindable where Self: NSObjectProtocol {
    public var observable: Observable<BoundType>? {
        get {
            return objc_getAssociatedObject(self, &BindableKey) as? Observable<BoundType>
        }
        set {
            objc_setAssociatedObject(self, &BindableKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
