//
//  LoginVC.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 06/03/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    var screen: LoginScreen?
    var auth  : Auth?
    var alert : Alert?
    
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
        screen?.delegate( delegate:  self)
        screen?.configTextFieldDelegate(delegate: self)
        
      //  auth = Auth.auth()
      //  alert = Alert(controller: self )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}
extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
}

extension LoginVC: LoginScreenProtocol{
    func actionLoginButton() {
        
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true )
        
//        guard let login = self.loginScreen else { return }
//
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
//
//            if error != nil{
//                self.alert?.getAlert(titulo: "Atenção", mensagem: "Login ou senha inválido !")
//
//            }else {
//                if usuario == nil  {
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Usuário inválido")
//                }else {
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Login efetuado com Sucesso!")
//                }
//            }
//        })
        
    }
    
    func actionRegisterButton() {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true )
        
    }
}
