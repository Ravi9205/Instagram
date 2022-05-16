//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    private var profileArray = [String]()
    
    private var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileCell.self, forCellReuseIdentifier:"Cell")
        return tableView
    }()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        profileArray = ["LogOut"]
        self.title = "User Profile"

    }
    
    
    private func  setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as? ProfileCell else {
            fatalError()
        }
        cell.textLabel?.text = profileArray[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = view.bounds
        headerView.backgroundColor = .systemGreen
        
        let imageView = UIImageView(frame: CGRect(x:headerView.frame.size.width/2.0, y: headerView.top+30, width: 100, height: 100))
        imageView.layer.cornerRadius = headerView.height/2.0
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1.0
        imageView.backgroundColor = .red
        imageView.layer.borderColor = UIColor.gray.cgColor
        headerView.addSubview(imageView)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title:Constants.logOut, message:Constants.logOutMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title:Constants.OkAlertTitle, style: .cancel, handler:{ [weak self] _  in
            self?.LogOut()
            
        })
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
        
    }
    
    //MARK:- LogOut from Firebase
    private func LogOut(){
        do {
            try  Auth.auth().signOut()
            navigateToLoginVC()
        }
        catch {
            print("Error while Logging Out")
        }
    }
    
   private func navigateToLoginVC(){
        let login = LoginViewController()
        login.modalPresentationStyle = .fullScreen
        present(login, animated: false, completion: nil)
    }
}
