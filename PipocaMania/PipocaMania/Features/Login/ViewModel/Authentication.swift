//
//  Authentication.swift
//  PipocaMania
//
//  Created by Thiago Mafra on 13/07/22.
//

import Foundation

class Authentication: NSObject {
    
    var user: User!
//    var username: String { return user.userName}
    var email: String { return user.email}
    
    
    
    func authenticationUserWith(_ email: String, andPassworld senha: String) {
        if email.count != 0 {
            if senha.count != 0 {
                verifyUserWith(email, andPassworld: senha)
                
            } else {
                // senha empty
            }
            
        } else {
          // email empty
        }
    }
    fileprivate func verifyUserWith(_ email: String, andPassworld senha: String) {
        if email == "test" && senha == "123456" {
           user = User (email: email , senha: senha)
        
        } else {
            
        }
    }
}
