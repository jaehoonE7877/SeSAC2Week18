//
//  APIService.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/02.
//

import Foundation
import Alamofire



struct Login: Codable {
    let token: String
}

class APIService {
    
    static let shared = APIService()
    
    private init() { }
    //매개변수로 연관값을 넣어줄 수 있음
    func signup() {
        let api = SeSacAPI.signup(userName: "testJack123", email: "testJack123@testJack.com", password: "12345678")
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseString { response in
            print(response)
            print(response.response?.statusCode)

        }
        
    }
    
    func login() {
        let api = SeSacAPI.login(email: "testJaehoon@testJaehoon.com", password: "12345678")
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).validate(statusCode: 200...299).responseDecodable(of: Login.self) { response in
            switch response.result {
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
                
            case .failure(_):
                //상태코드에 대한 대응해줘야 함
                print(response.response?.statusCode)
            }
        }
            
            
            
        
    }
    
    func profile() {
        let api = SeSacAPI.profile
        AF.request(api.url, method: .get, headers: api.headers).validate(statusCode: 200...299).responseDecodable(of: Profile.self) { response in
            
            switch response.result {
            case .success(let data):
                dump(data)
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
}
