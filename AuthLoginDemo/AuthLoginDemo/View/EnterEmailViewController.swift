//
//  EnterEmailViewController.swift
//  AuthLoginDemo
//
//  Created by 유현재 on 2022/09/13.
//

import UIKit

class EnterEmailViewController: BaseViewController {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 20
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 주소가 무엇인가요?"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var emailInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호를 입력해주세요."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var passwordInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var confirmBtn: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            let mainView = MainViewController()
            self?.navigationController?.pushViewController(mainView, animated: true)
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "이메일/비밀번호 입력하기"
        initViewSetting()
    }
}

extension EnterEmailViewController: InitalizeViewProtocol {
    func initViewSetting() {
        navigationController?.navigationBar.isHidden = false
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailInput)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordInput)
        stackView.addArrangedSubview(errorLabel)
        
        view.addSubview(confirmBtn)
        
        updateLayout()
        
        emailInput.becomeFirstResponder()
    }
    
    func updateLayout() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailInput.heightAnchor.constraint(equalToConstant: 50),
            passwordInput.heightAnchor.constraint(equalToConstant: 50),
            
            confirmBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            confirmBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmBtn.widthAnchor.constraint(equalToConstant: 100),
            confirmBtn.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmail = emailInput.text == ""
        let isPassword = passwordInput.text == ""
        
        confirmBtn.isEnabled = !isEmail && !isPassword
    }
}
