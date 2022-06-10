import UIKit
import Reusable

class ProfileHeaderView: UITableViewHeaderFooterView, NibLoadable, Reusable {
 
    @IBOutlet private weak var perfilImageView: UIImageView!

    @IBOutlet private weak var nameLabel: UILabel!

        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(name: String?, imageName: String?) {
        nameLabel.text = name
        perfilImageView.image = UIImage(named: imageName ?? String())
    }
    
}
