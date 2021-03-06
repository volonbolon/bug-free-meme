//
//  StationsView.swift
//  BugFreeMeme_iOS
//
//  Created by Ariel Rodriguez on 05/04/2020.
//  Copyright © 2020 Ariel Rodriguez. All rights reserved.
//

import UIKit
import BugFreeMemeUIKit
import BugFreeMemeKit

public class StationsView: NiblessTableView {
    static let StationsViewCellIdentifier = "StationsViewCellIdentifier"

    let stationsDatasource: UITableViewDataSource
    let stationsDelegate: UITableViewDelegate
    let viewModel: StationsViewModel

    init(stationsDatasource: UITableViewDataSource,
         stationsDelegate: UITableViewDelegate,
         viewModel: StationsViewModel) {
        self.stationsDelegate = stationsDelegate
        self.stationsDatasource = stationsDatasource
        self.viewModel = viewModel

        super.init(frame: .zero, style: .plain)

        self.register(UITableViewCell.self, forCellReuseIdentifier: StationsView.StationsViewCellIdentifier)

        self.delegate = self.stationsDelegate
        self.dataSource = self.stationsDatasource
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        self.bindViewModel()
    }
}

extension StationsView { // MARK: - Helpers
    fileprivate func bindViewModel() {
        self.viewModel.observable?.bind({ stations in
            self.reloadData()
        })
    }
}

