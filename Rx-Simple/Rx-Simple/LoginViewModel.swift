//
//  LoginViewModel.swift
//  Rx-Simple
//
//  Created by mac on 7/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
