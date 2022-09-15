//
//  MainViewController.swift
//  AuthLoginDemo
//
//  Created by 유현재 on 2022/09/13.
//

import UIKit
import FirebaseAuth

class MainViewController: BaseViewController {
    
    private lazy var welcomeText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "환영합니다."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var logoutBtn: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            self?.logout()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewSetting()
    }
    
    private func logout() {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("ERROR: singout \(signOutError.localizedDescription)")
        }
    }
}

extension MainViewController: InitalizeViewProtocol {
    
    func initViewSetting() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        view.addSubview(welcomeText)
        view.addSubview(logoutBtn)
        
        updateLayout()
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        welcomeText.text = """
        환영합니다!
        \(email)님
        """
    }
    
    func updateLayout() {
        NSLayoutConstraint.activate([
            welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logoutBtn.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 20),
            logoutBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
