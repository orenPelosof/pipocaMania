import UIKit
import Reusable

protocol ProfileFooterViewDelegate: AnyObject {
    func didTapRegister()
}

final class ProfileFooterView: UITableViewHeaderFooterView, NibLoadable, Reusable {
    
    weak var delegate: ProfileFooterViewDelegate?
    
    @IBOutlet private weak var registerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerButton.setTitle("Alterar dados", for: .normal)
        registerButton.setTitleColor(.secondary, for: .normal)
        registerButton.addTarget(self, action: #selector(regiter), for: .touchUpInside)
    }
    
    @objc
    private func regiter() {
        delegate?.didTapRegister()
    }
    
}

