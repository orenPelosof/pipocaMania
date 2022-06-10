import UIKit
import Reusable

final class ProfileViewController: UIViewController, StoryboardBased {
        
    private lazy var profileView: ProfileView = .loadFromNib()
    
    private var data: ProfileModel? {
        didSet {
            updateView()
        }
    }
    
    override func loadView() {
        super.loadView()
        profileView.footerDelegate = self
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        data = .makeProfileModel()
    }
    
    private func updateView() {
        guard let data = data else { return }
        profileView.update(with: data)
    }
}

extension ProfileViewController: ProfileFooterViewDelegate {
    func didTapRegister() {
//        let loginViewController = LoginViewController.instantiate()
//        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
