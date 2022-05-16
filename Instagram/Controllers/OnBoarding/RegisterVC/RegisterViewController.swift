//
//  RegisterVC.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    var registerUserViewModel = RegisterUserViewModel()
    
    public let userNameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter user name "
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGroupedBackground
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor =  UIColor.secondaryLabel.cgColor
        textField.layer.cornerRadius = Constants.cornerRadius
        return textField
    }()
    
    
    public let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email address"
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGroupedBackground
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor =  UIColor.secondaryLabel.cgColor
        textField.layer.cornerRadius = Constants.cornerRadius
        return textField
    }()
    
    public let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.returnKeyType = .continue
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGroupedBackground
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor =  UIColor.secondaryLabel.cgColor
        textField.layer.cornerRadius = Constants.cornerRadius
        return textField
    }()
    
    
    private let registerButton:UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.backgroundColor = .systemGreen
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetUp()
        view.backgroundColor = .systemBackground
        registerUserViewModel.delegates = self
        
    }
    
    private func  registerNewUser(){
        
        if Reachability.isConnectedToNetwork() {
            guard let userName = userNameTextField.text , let email = emailTextField.text, let password = passwordTextField.text else {
                return
            }
            
            let registerRquest =  RegisterUserRequest(userName: userName, email: email, password: password)
            
            registerUserViewModel.register(regitserRequest: registerRquest) {[weak self] success in
                
                DispatchQueue.main.async {
                    if success {
                        print("Successfully register")
                        // DO SOME BASIC STUFF
                        self?.dismiss(animated: true, completion: nil)
                    }
                    else {
                        let alert = UIAlertController(title:"Faild to register", message:"Error registering new user", preferredStyle: .alert)
                        let action = UIAlertAction(title:"Dissmiss", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self?.present(alert, animated: true, completion: nil)
                        
                    }
                }
            }
        }
        else{
            let alert = UIAlertController(title:"No Internet connection", message:"Woops No Internet connection please check and try again", preferredStyle: .alert)
            let action = UIAlertAction(title:"Dissmiss", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        
        userNameTextField.frame =  CGRect(x: 25,
                                          y: view.safeAreaInsets.top+100,
                                          width: view.width - 50,
                                          height: 52)
        
        emailTextField.frame =  CGRect(x: 25,
                                       y: userNameTextField.bottom+20,
                                       width: view.width - 50,
                                       height: 52)
        
        passwordTextField.frame =  CGRect(x: 25,
                                          y: emailTextField.bottom+20,
                                          width: view.width - 50,
                                          height: 52)
        
        registerButton.frame =  CGRect(x: 25,
                                       y: passwordTextField.bottom+20,
                                       width: view.width - 50,
                                       height: 52)
        
    }
    
    private func UISetUp(){
        
        //MARK:- Adding and SubViewing UI Component
        view.addSubview(userNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        //MARK:- Target action
        
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        
    }
    
    //MARK:- SignUp Button Action
    @objc  func  didTapRegister(){
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        registerNewUser()
    }
    
}
