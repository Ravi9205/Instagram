//
//  HomeViewController.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Check Auth Status
        handleAuthStatus()
        
        
    }
    
    private func handleAuthStatus(){
        if Auth.auth().currentUser == nil {
            // Show Login
            let login = LoginViewController()
            login.modalPresentationStyle = .fullScreen
            present(login, animated: false, completion: nil)
            
        }
    }
}
