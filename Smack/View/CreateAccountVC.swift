//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 20/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else{return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        AuthService.instance.registerUSer(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUSer(email: email, password: pass) { (success) in
                    if success{
                        print("logged in user!", AuthService.instance.authToken)
                    }
                }
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
}
