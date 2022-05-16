//
//  LoginViewController.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    
    public let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter user name or email address"
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
    
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    
    private let createAccountButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("New User? Create An Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    
    private let termsButton:UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyPolicyButton:UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    
    private let headerView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .red
        let backgroundImage = UIImageView(image: UIImage(named: ImageCollection.instagramGradient))
        view.addSubview(backgroundImage)
        return view
    }()
    
    var loginViewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        loginViewModel.delegate = self
        configureViewSetup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        UIComponentFrameSetUp()
        
    }
    
    private func UIComponentFrameSetUp(){
        
        // frames for UI components
        headerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height/3.0)
        
        emailTextField.frame =  CGRect(x: 25,
                                       y: headerView.bottom+50,
                                       width: view.width - 50,
                                       height: 52)
        
        passwordTextField.frame =  CGRect(x: 25,
                                          y: emailTextField.bottom+20,
                                          width: view.width - 50,
                                          height: 52)
        
        loginButton.frame =  CGRect(x: 25,
                                    y: passwordTextField.bottom+20,
                                    width: view.width - 50,
                                    height: 52)
        
        createAccountButton.frame =  CGRect(x: 25,
                                            y: loginButton.bottom+20,
                                            width: view.width - 50,
                                            height: 52)
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom-120,
                                   width: view.width-20,
                                   height: 50)
        
        privacyPolicyButton.frame = CGRect(x: 10,
                                           y: view.height-view.safeAreaInsets.bottom-70,
                                           width: view.width-20,
                                           height: 50)
        
        configureHeaderView()
        
    }
    
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        let imageView = UIImageView(image: UIImage(named:ImageCollection.instaWithoutBack))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
        
    }
    
    
    private func configureViewSetup(){
        
        //MARK:- SubViewing UI Components
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyPolicyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        
        //MARK:- Adding Target to the buttons
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAnAccountButtonTapped), for: .touchUpInside)
        
        
    }
    
    //MARK:- Login Action
    @objc func loginButtonTapped(){
        
        if Reachability.isConnectedToNetwork() {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            
            guard let email = emailTextField.text, let password = passwordTextField.text  else {
                return
            }
            
            let loginRequest = LoginRequest(email: email, password: password)
            loginViewModel.loginUser(loginRequest: loginRequest) { [weak self] success in
                
                DispatchQueue.main.async {
                    if success {
                        print("User Logged in successfully")
                        self?.dismiss(animated: false, completion: nil)
                    }
                    
                    else {
                        let alertVC = UIAlertController(title:"Log In Error", message:"Error occured while login", preferredStyle: .alert)
                        alertVC.addAction(UIAlertAction(title:"Dissmiss", style: .cancel, handler: nil))
                        self?.present(alertVC, animated: true, completion: nil)
                    }
                }
            }
        }
        else{
            let alertVC = UIAlertController(title:"No Internet", message:"Opps Please check your internet connection before you procced", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title:"Dissmiss", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
        
        
    }
    
    //MARK:- Create New Account
    @objc func createAnAccountButtonTapped(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
        vc.modalPresentationStyle = .fullScreen
        present(UINavigationController(rootViewController: vc), animated: false, completion: nil)
    }
    
    //MARK:- Terms of Use
    
    @objc func termsButtonTapped(){
        
        guard let url = URL(string:URLCollection.termsCondtions) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
        
    }
    
    //MARK:- Privacy Policy
    
    @objc func privacyPolicyTapped(){
        
        guard let url = URL(string:URLCollection.privacyPolicy) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}
