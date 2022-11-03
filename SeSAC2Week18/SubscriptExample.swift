//
//  SubscriptExample.swift
//  SeSAC2Week18
//
//  Created by Seo Jae Hoon on 2022/11/03.
//

import Foundation

extension String {
    
    //jack >>>> [10] >>>> nil
    
    subscript(idx: Int) -> String? {
        
        guard (0..<count).contains(idx) else {
            return nil
        }
        
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
    }
    
}

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

struct Phone {
    
    var numbers = ["1234", "5679", "3353", "2222"]
    
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
}
