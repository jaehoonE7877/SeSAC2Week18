//
//  Endpoint.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/02.
//

import Foundation
import Alamofire

enum LoginParameter: String {
    case userName
    case email
    case password
}

enum SeSacAPI {
    case signup(userName: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}

extension SeSacAPI {
    
    var url: URL {
        switch self {
        case .signup:
            return URL(string: "http://api.memolease.com/api/v1/users/signup")!
        case .login:
            return URL(string: "http://api.memolease.com/api/v1/users/login")!
        case .profile:
            return URL(string: "http://api.memolease.com/api/v1/users/me")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signup, .login:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .profile:
            return [
                "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .signup(let userName, let email,let password):
            return [
                LoginParameter.userName.rawValue: userName,
                LoginParameter.email.rawValue: email,
                LoginParameter.password.rawValue: password
            ]
        case .login(let email, let password):
            return [
                LoginParameter.email.rawValue: email,
                LoginParameter.password.rawValue: password
            ]
        default: return ["": ""]
        }
    }
    
}
