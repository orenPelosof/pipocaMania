//
//  TitleDetailViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

protocol MovieTitleViewCellDelegate {
    func isStarButtonTouched(film: MovieModel)
}

final class MovieTitleViewCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var starRanking: UILabel!
    @IBOutlet var watchLaterButton: UIButton!
    
    var movieDetail: MovieModel?
    
    var cellDelegate: MovieTitleViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
    }
    
    func update(with movie: MovieModel?) {
        self.movieDetail = movie
        titleDetailLabel.text = movie?.title
        durationLabel.text = "\(movie?.runtime ?? 0) minutos"
        starRanking.text = "\(movie?.voteAverage ?? 0.0)(lmdb)"
    }
    
    @IBAction func watchLaterAction(_ sender: Any) {
        cellDelegate?.isStarButtonTouched(film: movieDetail!)
    }
}
