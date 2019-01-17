//
//  CitiesTableView.swift
//  cities
//
//  Created by Martin Roeder on 1/17/19.
//  Copyright © 2019 Martin Roeder. All rights reserved.
//

import UIKit

class CitiesTableView: UITableViewController {

    let data = CityData()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.listOfCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath)
        let text = "\(data.listOfCities[indexPath.row].name), \(data.listOfCities[indexPath.row].country)"
        cell.textLabel?.text = text
        return cell
    }

}
