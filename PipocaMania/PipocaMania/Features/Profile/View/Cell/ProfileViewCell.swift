import UIKit
import Reusable

class ProfileViewCell: UITableViewCell, NibLoadable, Reusable {
    
    @IBOutlet private weak var infoLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.backgroundColor = .primary
    }
    
    func update(with title: String?) {
        infoLabel.text = title
        
        
    }
    
}
