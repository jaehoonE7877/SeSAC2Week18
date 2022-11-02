//
//  UserModel.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/02.
//

import Foundation

struct Profile: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let photo: String
    let email: String
    let username: String
}
