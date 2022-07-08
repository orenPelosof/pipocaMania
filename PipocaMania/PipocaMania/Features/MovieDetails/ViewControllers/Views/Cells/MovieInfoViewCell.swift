//
//  InfoDetailViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class MovieInfoViewCell: UITableViewCell, NibLoadable, Reusable {
    
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreDescriptionLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
        genreDescriptionLabel.layer.cornerRadius = genreDescriptionLabel.bounds.height / 2
//        genreDescriptionLabel.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        genreDescriptionLabel.setTitleColor(.white, for: .normal)
    }
    
    func update(with movie: MovieModel?) {
        dateLabel.text = movie?.releaseDate
        genreDescriptionLabel.setTitle(movie?.genres?.first?.name, for: .normal)
    }
    
}
