//
//  InfoDetailViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class InfoDetailViewCell: UITableViewCell, NibLoadable, Reusable {
    
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreDescriptionLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
    }
    
}
