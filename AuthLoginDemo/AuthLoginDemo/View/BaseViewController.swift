//
//  BaseViewController.swift
//  AuthLoginDemo
//
//  Created by 유현재 on 2022/09/13.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}

extension BaseViewController {
    
    func initView() {
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true
    }
}
