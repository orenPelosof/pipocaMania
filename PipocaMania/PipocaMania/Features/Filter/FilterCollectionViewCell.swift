//
//  FilterCollectionViewCell.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 08/06/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var posterImageView: UIImageView!
    
    func configureCell(_ poster: String) {
        posterImageView.image = UIImage(named: poster)
    }

}
