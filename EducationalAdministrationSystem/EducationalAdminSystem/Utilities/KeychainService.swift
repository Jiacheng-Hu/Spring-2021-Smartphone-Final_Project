//
//  KeychainService.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/21.
//

import Foundation
import KeychainSwift

class KeychainService {
    
    var _keyChain = KeychainSwift()
    
    var keyChain: KeychainSwift {
        
        get {
            return _keyChain
        }
        
        set {
            _keyChain = newValue
        }
        
    }
    
}
