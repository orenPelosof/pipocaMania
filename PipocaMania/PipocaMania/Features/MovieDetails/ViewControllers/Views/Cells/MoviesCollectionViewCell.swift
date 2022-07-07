import UIKit
import Reusable

final class MoviesCollectionViewCell: UICollectionViewCell,  NibLoadable, Reusable {
    
    @IBOutlet weak var relatedFilmeImage: UIImageView!
    @IBOutlet weak var relatedTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
