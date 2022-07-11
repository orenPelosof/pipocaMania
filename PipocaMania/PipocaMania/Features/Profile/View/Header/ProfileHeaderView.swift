import UIKit
import Reusable

protocol ProfileHeaderViewDelegate {
    func imagemClick()
}

class ProfileHeaderView: UITableViewHeaderFooterView, NibLoadable, Reusable {
    
    @IBOutlet private weak var perfilImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var delegate: ProfileHeaderViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        perfilImageView.isUserInteractionEnabled = true
        perfilImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.imagemClick()
    }
    
    func update(name: String?, imageName: UIImage?) {
        nameLabel.text = name
        perfilImageView.image = imageName
    }
    
}
