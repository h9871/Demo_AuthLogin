//
//  ViewProtocol.swift
//  AuthLoginDemo
//
//  Created by 유현재 on 2022/09/13.
//

import Foundation

@objc protocol InitalizeViewProtocol {
    func initViewSetting()
    func updateLayout()
    @objc optional func initTableView()
    @objc optional func initCollectionView()
}
