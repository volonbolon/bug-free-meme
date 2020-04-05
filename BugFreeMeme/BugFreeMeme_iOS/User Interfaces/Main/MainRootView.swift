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
import CoreLocation
import BugFreeMemeKit

public class MainRootView: NiblessView {
    private static let pinIdentifier = "pin"
    private var hierarchyNotReady = true
    private var mapLoaded = false
    let viewModel: MainRootViewModel
    var networks: [Network] = []

    init(viewModel: MainRootViewModel) {
        self.viewModel = viewModel

        super.init(frame: .zero)
    }

    var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        mapView.register(MKMarkerAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: MainRootView.pinIdentifier)

        return mapView
    }()

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        guard hierarchyNotReady else {
            return
        }

        self.constructHierarchy()
        self.activateConstraints()
        self.bindViewModel()

        self.backgroundColor = UIColor.white

        self.hierarchyNotReady = false
    }
}

extension MainRootView { // MARK: - Helpers
    fileprivate func bindViewModel() {
        self.viewModel.observable?.bind { networks in
            self.networks = networks
            self.dropPins(networks: self.networks)
        }
    }

    fileprivate func dropPins(networks: [Network]) {
        guard self.mapLoaded else {
            return
        }

        networks.forEach { network in
            let location = network.location
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude,
                                                    longitude: location.longitude)
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = network.id
            self.mapView.addAnnotation(pin)
        }
    }

    fileprivate func constructHierarchy() {
        self.addSubview(self.mapView)
        self.mapView.delegate = self
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


extension MainRootView: MKMapViewDelegate {
    public func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        self.mapLoaded = false
    }

    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        self.mapLoaded = true
        self.viewModel.uxResponder?.refreshNetworks()
    }

    public func mapView(_ mapView: MKMapView,
                        viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MainRootView.pinIdentifier,
                                                                   for: annotation)
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .infoDark)

        return annotationView
    }

    public func mapView(_ mapView: MKMapView,
                        annotationView view: MKAnnotationView,
                        calloutAccessoryControlTapped control: UIControl) {
        guard let annotationTitle = view.annotation?.title else {
            return
        }
        if let network = self.networks.first(where: { network -> Bool in
            return network.id == annotationTitle
        }) {
            if let responder = viewModel.uxResponder {
                responder.showStations(network: network)
            }
        }
    }
}
