import UIKit
import Reusable

final class MoviesCollectionViewCell: UICollectionViewCell,  NibLoadable, Reusable {
    
    @IBOutlet weak var relatedFilmeImage: UIImageView!
    @IBOutlet weak var relatedTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        relatedFilmeImage.layer.cornerRadius = relatedFilmeImage.bounds.height / 10
    }
    
    func update(with relatedMovie: MovieModel) {
        let path = "\(Environment.imageBasePath)\(relatedMovie.posterPath ?? String())"
        guard let url = URL(string: path) else  {
            relatedFilmeImage.image = UIImage(named: "emptyImage")
            return
        }
        relatedFilmeImage.download(from: url)
        relatedTitleLabel.text = relatedMovie.title
        
    }
}
