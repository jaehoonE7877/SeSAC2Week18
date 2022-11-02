//
//  ViewController.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APIService.shared.profile() // userdefaults에 저장했던 토큰정보로 다시 통신해서 프로필정보 가져오기
    }


}

