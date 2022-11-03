//
//  ProfileViewModel.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/03.
//

import Foundation
import RxSwift

final class ProfileViewModel {
    
    let profile = PublishSubject<Profile>()
    
    func getProfile() {
        let api = SeSacAPI.profile
        Network.shared.request(type: Profile.self, url: api.url, headers: api.headers) { [weak self] response in
            
            guard let self = self else { return }
            
            switch response {
            
            case .success(let success):
                self.profile.onNext(success)
            case .failure(let failure):
            
                self.profile.onError(failure)
            }
        }
    }
    
}
