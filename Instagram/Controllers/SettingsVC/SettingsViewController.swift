//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    private var settingsArray = [[SettingsModel]]()
    
    private var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        configureModels()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    private func  setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func  configureModels(){
        let section = [
            SettingsModel(title:"Log Out", handler: { [weak self] in
                self?.didTappedLogOut()
            })
            
        ]
        settingsArray.append(section)
    }
    
    private func didTappedLogOut(){
        let actionSheet = UIAlertController(title:Constants.logOut, message:Constants.logOutMessage, preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title:Constants.logOut, style: .destructive, handler:{ [weak self] _  in
            AuthManager.shared.LogOut { success in
                if success {
                    DispatchQueue.main.async {
                        self?.navigateToLoginVC()
                    }
                }
                else {
                    let alert = UIAlertController(title:Constants.ErrorAlertTitle , message:Constants.errorLogOut, preferredStyle: .alert)
                    let action = UIAlertAction(title: Constants.OkAlertTitle, style: .cancel, handler: nil)
                    alert.addAction(action)
                    self?.present(alert, animated: true, completion: nil)
                }
            }
            
        })
        
        let cancel = UIAlertAction(title:Constants.CancelAlertTitle, style: .cancel, handler: nil)
        actionSheet.addAction(okAction)
        actionSheet.addAction(cancel)
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        self.present(actionSheet, animated: false, completion: nil)
    }
    
}


extension SettingsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingsArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        cell.textLabel?.text = settingsArray[indexPath.section][indexPath.row].title
        cell.selectionStyle = .none
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    /*
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
     let headerView = UIView()
     headerView.frame = view.bounds
     headerView.backgroundColor = .systemGreen
     
     let imageView = UIImageView()
     imageView.frame = headerView.frame
     imageView.image = UIImage.init(named:ImageCollection.instagramGradient)
     //imageView.layer.cornerRadius = headerView.height/2.0
     imageView.contentMode = .scaleAspectFill
     //imageView.layer.borderWidth = 1.0
     //imageView.backgroundColor = .red
     //imageView.layer.borderColor = UIColor.gray.cgColor
     headerView.addSubview(imageView)
     return headerView
     
     }
     
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 300.0
     }
     
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let model =  settingsArray[indexPath.section][indexPath.row]
        model.handler()
    }
    
    
    
    private func navigateToLoginVC(){
        let login = LoginViewController()
        login.modalPresentationStyle = .fullScreen
        present(login, animated: true) { [weak self] in
            self?.navigationController?.popToRootViewController(animated: false)
            self?.tabBarController?.selectedIndex = 0
            
        }
    }
}
