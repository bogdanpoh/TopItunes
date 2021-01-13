//
//  MainTableViewCell.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 27.12.2020.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var explicitLabel: UILabel!
    
    
    static let mainCellId = "MainCell"
    static let mainCellHeight: CGFloat = 70
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cover.image = UIImage(named: "icon")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func createUINib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    
    func setChartItem(chartItem: Chart, indexPath: IndexPath) {
        
        NetworkService().getImage(urlString: chartItem.artworkUrl100) { [weak self] data in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                guard let self = self else { return }
                
                if let image = UIImage(data: data) {
                    self.cover.image = image
                }
            }
            
        }
        
        self.numberLabel.text = String(indexPath.row + 1)
        self.nameLabel.text = chartItem.name
        self.artistNameLabel.text = chartItem.artistName
        
        if chartItem.contentAdvisoryRating != nil {
            self.explicitLabel.isHidden = false
        } else {
            self.explicitLabel.isHidden = true
        }
    }
    
}
