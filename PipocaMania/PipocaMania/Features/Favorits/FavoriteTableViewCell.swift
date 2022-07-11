//
//  FavoriteTableViewCell.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/8/22.
//

import UIKit
import Reusable

class FavoriteTableViewCell: UITableViewCell, NibLoadable, Reusable {
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var filmeTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .primary
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with movie: Filme?, posterImage: UIImage) {
        guard let movie = movie else {return}
        favoriteImageView.image = posterImage
        filmeTitleLabel.text = movie.titulo
        descriptionLabel.text = movie.titulo
    }
    
}
