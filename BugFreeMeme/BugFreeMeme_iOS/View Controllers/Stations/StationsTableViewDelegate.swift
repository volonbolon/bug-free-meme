//
//  StationsTableViewDelegate.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 05/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeKit

class StationsTableViewDelegate: NSObject, UITableViewDelegate {
    let viewModel: StationsViewModel
    let observable: Observable<[Station]>

    init(viewModel: StationsViewModel, observable: Observable<[Station]>) {
        self.viewModel = viewModel
        self.observable = observable

        super.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let station = observable.value[indexPath.row]
        self.viewModel.uxResponder?.goToStationDetails(station)
    }
}

class StationsTableViewDatasource: NSObject, UITableViewDataSource {
    let cellIdentifier: String
    let observable: Observable<[Station]>

    init(cellIdentifier: String, observable: Observable<[Station]>) {
        self.cellIdentifier = cellIdentifier
        self.observable = observable
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let stations = self.observable.value
        return stations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stations = self.observable.value
        let station = stations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        cell.textLabel?.text = station.name
        return cell
    }
}
