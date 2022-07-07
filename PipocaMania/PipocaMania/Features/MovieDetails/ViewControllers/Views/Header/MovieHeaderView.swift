import UIKit
import Reusable

final class MovieHeaderView: UITableViewHeaderFooterView, NibLoadable, Reusable {
    
    @IBOutlet weak var posterDetailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with movie: MovieModel?) {
        guard let movie = movie,
            let url = URL(string: "\(Environment.imageBasePath)\(movie.backdropPath ?? String())"
        ) else {
            return
        }
        posterDetailImage.download(from: url)
    }
}
