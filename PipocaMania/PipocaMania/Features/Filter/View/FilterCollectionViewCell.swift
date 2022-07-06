//
//  FilterCollectionViewCell.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 08/06/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var labelTituloFilmes: UILabel!
    
    func configureCell(_ poster: UIImage, _ titulo: String) {
        posterImageView.image = poster
        labelTituloFilmes.text = titulo
        
    }
    
}
