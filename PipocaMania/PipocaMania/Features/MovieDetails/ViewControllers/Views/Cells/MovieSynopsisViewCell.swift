import UIKit
import Reusable

final class MovieSynopsisViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak var sinopseLabel: UILabel!
    @IBOutlet weak var sinopseDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .primary
        selectionStyle = .none
    }
    
}
