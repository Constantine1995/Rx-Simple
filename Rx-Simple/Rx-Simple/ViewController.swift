//
//  ViewController.swift
//  Rx-Simple
//
//  Created by mac on 7/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var emailTexrField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnabledLabel: UILabel!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = emailTexrField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginEnabledLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLabel.textColor = isValid ? .green : .red
            }, onError: { error in
                print(error)
        }, onCompleted: {
            print("finish")
        }, onDisposed: {
            print("disposed")
        }).disposed(by: disposeBag)
    }
    
    
}

