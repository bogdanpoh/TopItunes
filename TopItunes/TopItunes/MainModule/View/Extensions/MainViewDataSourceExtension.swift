//
//  MainViewDataSource.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.chart?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.mainCellId, for: indexPath) as! MainTableViewCell
        
        cell.accessoryType = .disclosureIndicator
        
        let chartItem = presenter.chart?[indexPath.row]
        
        if let item = chartItem {
            cell.setChartItem(chartItem: item, indexPath: indexPath)
        }
        
        return cell
    }
    
}
