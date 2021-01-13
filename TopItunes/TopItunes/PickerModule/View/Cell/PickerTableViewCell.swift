//
//  PickerTableViewCell.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import UIKit

class PickerTableViewCell: UITableViewCell {

    static let identifier: String = "PickerCell"
    
    var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel = UILabel()
        setupTitleLabel()
    }

    func setupCell(title: String) {
        titleLabel.text = title
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive =  true
    }
    
    static func createNib() -> UINib {
        return UINib(nibName: "PickerTableViewCell", bundle: nil)
    }
}
