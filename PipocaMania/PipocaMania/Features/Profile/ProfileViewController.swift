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
        profileView.delegate = self
    }
    func abrirCamera() {
        let vc = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alertController = UIAlertController(title: nil, message: "Você deseja abrir a camera ou de fotos galeria", preferredStyle: .alert)
            
            let galeriaAction = UIAlertAction(title: "Galeria", style: .default, handler: { (alert: UIAlertAction!) in
                vc.sourceType = .photoLibrary
                vc.allowsEditing = true
                vc.delegate = self
                self.present(vc, animated: true)
            })
            
            let cameraAction = UIAlertAction(title: "Camêra", style: .default, handler: { (alert: UIAlertAction!) in
                vc.sourceType = .camera
                vc.allowsEditing = true
                vc.delegate = self
                self.present(vc, animated: true)
            })
            
            alertController.addAction(galeriaAction)
            alertController.addAction(cameraAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            
            
        }
        
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension ProfileViewController: ProfileFooterViewDelegate {
    func didTapRegister() {
//        let loginViewController = LoginViewController.instantiate()
//        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
}

extension ProfileViewController: ProfileViewDelegate {
    func imagemClick() {
        self.abrirCamera()
    }
    
    
}


extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        // print out the image size as a test
        profileView.image = image
        updateView()
    }
    
}
