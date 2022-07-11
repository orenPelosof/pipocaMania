//
//  MovieFavoriteViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class MovieFavoriteViewCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var filmeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
    }
    
    func update(with movie: MovieModel?, image: Data) {
        titleLabel.text = movie?.title
        descriptionLabel.text = movie?.title
        filmeImage.image = UIImage(data: image)
    }
    
}
