//
//  TelaDeLogin.swift
//  PipocaMania
//
//  Created by Thiago Mafra on 30/05/22.
//

import Foundation
import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FacebookLogin

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton()
                loginButton.center = view.center
                view.addSubview(loginButton)
        
    self.emailTextField.delegate = self
    self.senhaTextField.delegate = self
        }
    
    
    @IBAction func loginGoogleButtonAction(_ sender: Any) {
        loginGoogle()
    }
    
    private func loginGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

          // ...
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                  }
                  // ...
                  return
                }
                // User is signed in
                // ...
            }
            
        }
    

    
 //Botao entrar para navegar para a proxima pagina
    
    @IBAction func enterButtonAction(_ sender: Any) {
        let email: String? = self.emailTextField.text
        let senha: String? = self.senhaTextField.text
        
        print("dados de login do user: email:\(email)passworld:\(senha)")
    }
    
    // comando para trocar de textfield quando o usuario clicar em return!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            self.senhaTextField.becomeFirstResponder()
        }else{
            self.senhaTextField.resignFirstResponder()
        }
        return true
    }
    
    //Botao Registrar caso o usuario queira entrar no app e nao tenha um cadastro.
    
    @IBAction func registerButton(_ sender: Any) {
        let email: String! = self.emailTextField.text
        let senha: String! = self.senhaTextField.text
        
//print concatenando os dados do user e printando
        print("dados de login do user: email:\(email)passworld:\(senha)")
    }
}


