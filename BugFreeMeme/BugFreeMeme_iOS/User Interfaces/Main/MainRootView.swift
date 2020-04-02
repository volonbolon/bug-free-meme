//
//  MainRootView.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 02/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeUIKit
import MapKit

public class MainRootView: NiblessView {
    private var hierarchyNotReady = true

    var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false

        return mapView
    }()

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        guard hierarchyNotReady else {
            return
        }

        self.constructHierarchy()
        self.activateConstraints()

        self.backgroundColor = UIColor.white

        self.hierarchyNotReady = false
    }
}

extension MainRootView { // MARK: - Helpers
    fileprivate func constructHierarchy() {
        self.addSubview(self.mapView)
    }

    private func activateMapViewConstraints() {
        let xConstraint = self.mapView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
        let yConstraint = self.mapView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        let width = self.mapView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor)
        let heigth = self.mapView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor)
        let toActivate = [
            xConstraint,
            yConstraint,
            width,
            heigth
        ]
        NSLayoutConstraint.activate(toActivate)
    }

    fileprivate func activateConstraints() {
        self.activateMapViewConstraints()
    }
}
