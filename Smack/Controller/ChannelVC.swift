//
//  ChannelVC.swift
//  Smack
//
//  Created by Ivan Stanimirovic on 04/04/2020.
//  Copyright © 2020 Ivan Stanimirovic. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //postavljamo sirinu menija
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        //primanje obavestenja
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userdDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    @IBAction func prepareForUnwund(segue:UIStoryboardSegue){}

    @objc func userdDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIN{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }else{
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "manuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    
}
