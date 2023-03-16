//
//  LoginScreen.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 06/03/23.
//

import UIKit

protocol LoginScreenProtocol: class{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate( delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }

    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        return label
    }()
    
    lazy var logoAppImageView : UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage( named: "loginUser" )
         image.contentMode = .scaleAspectFit
         //image.backgroundColor = .red
         return image
     }()

    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.placeholder = "E-mail: user@outlook.com"
        tf.textColor = .darkGray
        tf.isSecureTextEntry = false
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default // defaut
        tf.placeholder = "Digite a senha:"
        tf.textColor = .darkGray
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Entrar", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.backgroundColor = UIColor( red: 102/255, green: 103/255, blue: 171/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
       
        return btn
    }()
    
    lazy var registerButton : UIButton = {
       let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("cadastre-se", for: .normal)
        register.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        register.setTitleColor(.darkGray, for: .normal)
        register.addTarget(self, action: #selector(tappedRegisterButton) , for: .touchUpInside)
        return register
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configViews()
        setupConstraints()
    }

    private func configBackground(){
           self.backgroundColor = .white 
       }
    
 private func configViews(){
        addSubview(loginLabel)
        addSubview(logoAppImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
     
    }

   public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
           self.delegate?.actionLoginButton()
       }
       
       @objc private func tappedRegisterButton(){
           self.delegate?.actionRegisterButton()
       }
    
    
    
    public func validarTextFields(){
         let email: String = self.emailTextField.text ?? ""
         let password: String = self.passwordTextField.text ?? ""
         
         if !email.isEmpty && !password.isEmpty{
             self.configButtonEnable(true)
         }else{
             self.configButtonEnable(false)
         }
     }
     
    private func configButtonEnable(_ enable : Bool ){
          if enable{
              self.loginButton.setTitleColor(.white, for: .normal)
              self.loginButton.isEnabled = true
          }else {
              self.loginButton.setTitleColor(.lightGray, for: .normal)
              self.loginButton.isEnabled = false
          }
      }
    
    public func getEmail() -> String{
            return self.emailTextField.text ?? ""
        }
        
        public func getPassword() -> String{
            return self.passwordTextField.text ?? ""
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
        
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoAppImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 16),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 150),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
    
    
}
