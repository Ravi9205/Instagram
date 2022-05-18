//
//  HomeViewController.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 11/05/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableCell.self, forCellReuseIdentifier:IGFeedPostTableCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Check Auth Status
        view.backgroundColor = .systemBackground
        handleAuthStatus()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:IGFeedPostTableCell.identifier, for: indexPath) as? IGFeedPostTableCell else {
            fatalError()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
