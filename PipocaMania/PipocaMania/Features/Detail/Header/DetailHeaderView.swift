//
//  DetailHeaderView.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class DetailHeaderView: UITableViewHeaderFooterView, NibLoadable, Reusable {
    
    @IBOutlet weak var posterDetailImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .primary
    }
}
