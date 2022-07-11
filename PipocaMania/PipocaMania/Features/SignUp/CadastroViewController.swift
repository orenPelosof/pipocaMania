//
//  CadastroViewController.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/22/22.
//

import UIKit

class CadastroViewController: UIViewController {
    
    @IBOutlet var NomeText: UITextField!
    @IBOutlet var CpfText: UITextField!
    @IBOutlet var TelefoneText: UITextField!
    @IBOutlet var EmailText: UITextField!
    @IBOutlet var ConfirmaEmailText: UITextField!
    @IBOutlet var SenhaText: UITextField!
    @IBOutlet var ConfirmeSenhaText: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func ButanConcluir(_ sender: Any) {
        if EmailText.text!.emailValido {
            print("valid")
        }
    }
}

extension String {

var emailValido: Bool { //se exite um @
    return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}").evaluate(with: self)
}
// var numeroValido: Bool {
 //   return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]).{10}$").evaluate(with: self)
  }

