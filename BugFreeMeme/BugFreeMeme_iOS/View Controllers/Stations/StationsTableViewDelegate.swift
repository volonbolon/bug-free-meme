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

    init(viewModel: StationsViewModel) {
        self.viewModel = viewModel

        super.init()
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
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        return cell
    }
}
