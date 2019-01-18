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
    var filteredCities: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        filteredCities = data.listOfCities
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath)
        let text = "\(filteredCities[indexPath.row].name), \(filteredCities[indexPath.row].country)"
        cell.textLabel?.text = text
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let city = filteredCities[indexPath.row]
                if let controller = segue.destination as? MapViewController {
                    controller.city = city
                }
            }
        }
    }
}

extension CitiesTableView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Info: search text \(searchText)")
        DispatchQueue.global(qos: .background).async {
            let filteredResult = self.data.filter(by: searchText)
            DispatchQueue.main.async {
                self.filteredCities = filteredResult
                self.tableView.reloadData()
            }
        }
    }
}
