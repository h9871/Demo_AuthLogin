//
//  LoginViewController.swift
//  AuthLoginDemo
//
//  Created by 유현재 on 2022/09/13.
//

import UIKit

class LoginViewController: BaseViewController {

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "music.house.fill")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.text = "내 마음에 꼭 드는 또 다른\n플레이리스트를\n발견해보세요."
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 15
        return view
    }()
    
    private lazy var emailBtn: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            let enterEmailView = EnterEmailViewController()
            self?.navigationController?.pushViewController(enterEmailView, animated: true)
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("이메일/비밀번호로 계속하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var googleBtn: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("구글로 계속하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "logo_google"), for: .normal)
        return button
    }()
    
    private lazy var appleBtn: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple로 계속하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "logo_apple"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewSetting()
    }
}

extension LoginViewController: InitalizeViewProtocol {
    func initViewSetting() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(emailBtn)
        buttonStackView.addArrangedSubview(googleBtn)
        buttonStackView.addArrangedSubview(appleBtn)
        
        updateLayout()
        
        [emailBtn, googleBtn, appleBtn].forEach {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white.cgColor
            $0.layer.cornerRadius = 30
        }
    }
    
    func updateLayout() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            emailBtn.heightAnchor.constraint(equalToConstant: 60),
            emailBtn.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            emailBtn.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            
            googleBtn.heightAnchor.constraint(equalToConstant: 60),
            googleBtn.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            googleBtn.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            
            appleBtn.heightAnchor.constraint(equalToConstant: 60),
            appleBtn.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            appleBtn.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
