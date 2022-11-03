//
//  ViewController.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/02.
//

import UIKit
import RxCocoa
import RxSwift

final class ViewController: UIViewController { //프로필 뷰
    
    private let viewModel: ProfileViewModel = ProfileViewModel()
    
    private let disposeBag = DisposeBag()
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let phone = Phone()
        print(phone[2])
        
        //APIService.shared.profile() // userdefaults에 저장했던 토큰정보로 다시 통신해서 프로필정보 가져오기
        //APIService.shared.login()
        setBinding()
        checkCOW()
    }
    
    private func setBinding() {
        
        viewModel.profile // <Single>, Syntax Sugar -> error처리
            .withUnretained(self)
            .subscribe { vc, value in
                vc.label.text = value.user.email
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        
        // subscribe, bind, drive
        // driver, signal
        
        viewModel.getProfile()
    }

    func checkCOW() {
        
        var test = "jack"
        address(&test) // in out 매개변수
        
        print(test[2])
        print(test[200])
        
        var test2 = test
        address(&test2)
        
        test2 = "Hue"
        address(&test)
        address(&test2)
        
        print("==============")
        var array = Array(repeating: "A", count: 100) //Array, Dictionary, Set 같은 collection type일때
        address(&array)
        
        print(array[safe: 99])
        print(array[safe: 199])
        
        // 값을 바꾸더라도 실제로 복사 안함. 원본을 참조하고 있음
        var array2 = array
        address(&array2)
        
        array2[0] = "B"
        //하나라도 바뀌고 나면 그때 복사해서 새로운 메모리에 할당한다.(실제로 객체의 수정이나 삭제가 생길 때)
        address(&array)
        address(&array2)
    }
    
    func address(_ value: UnsafeRawPointer) {
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }
    
    
}

