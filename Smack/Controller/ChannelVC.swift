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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //postavljamo sirinu menija
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

}
