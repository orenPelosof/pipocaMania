//
//  SynopsisDetailViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class SynopsisDetailViewCell: UITableViewCell, NibLoadable, Reusable {

    
    @IBOutlet weak var sinopseLabel: UILabel!
    @IBOutlet weak var sinopseDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
    }
    
}
