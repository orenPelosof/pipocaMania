//
//  FilterCollectionViewCell.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 08/06/22.
//

import UIKit
import Kingfisher

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var labelTituloFilmes: UILabel!
    
    func configureCell(_ filme: Movie) {
        KF.url(URL(string: "https://image.tmdb.org/t/p/w500\(filme.posterPath)")).set(to: posterImageView)
        labelTituloFilmes.text = filme.title
        
        self.contentView.layer.cornerRadius = self.layer.frame.width/10
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        
    }
    
}
