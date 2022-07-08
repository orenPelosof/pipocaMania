//
//  TitleDetailViewCell.swift
//  PipocaMania
//
//  Created by Wilton Fernandes da Silva on 08/06/22.
//

import UIKit
import Reusable

final class MovieTitleViewCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var starRanking: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
    }
    
    func update(with movie: MovieModel?) {
        titleDetailLabel.text = movie?.title
        durationLabel.text = "\(movie?.runtime ?? 0) minutos"
        starRanking.text = "\(movie?.voteAverage ?? 0.0)(lmdb)"
    }
    
}
