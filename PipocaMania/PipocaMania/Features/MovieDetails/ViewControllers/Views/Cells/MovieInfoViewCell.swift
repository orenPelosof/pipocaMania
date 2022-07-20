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
        genreDescriptionLabel.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        genreDescriptionLabel.setTitleColor(.white, for: .normal)
        genreDescriptionLabel.dropShadow()
    }
    
    func update(with movie: MovieModel?) {
        dateLabel.text = movie?.releaseDate
        genreDescriptionLabel.setTitle(movie?.genres?.first?.name, for: .normal)
    }
    
}

extension UIView {

  func dropShadow() {
      layer.shadowColor = UIColor.white.cgColor
      layer.shadowOffset = CGSize(width: 1, height: 1)
      layer.shadowOpacity = 0.2
      layer.shadowRadius = 2
  }
}
