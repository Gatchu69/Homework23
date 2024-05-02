//
//  UITableViewExtension.swift
//  Homework23
//
//  Created by Nodiko Gachava on 03.05.24.
//

import UIKit

extension FactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError("Error")
        }
        let info = catDataArray[indexPath.row]
        cell.configure(fact: info)
        return cell
    }
}


extension FactsViewController: FactsViewModelDelegate {
    func factsFetched(_ facts: [Facts]) {
        self.catDataArray = facts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
