//
//  TelaDeLogin.swift
//  PipocaMania
//
//  Created by Thiago Mafra on 30/05/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.emailTextField.delegate = self
    self.senhaTextField.delegate = self
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


