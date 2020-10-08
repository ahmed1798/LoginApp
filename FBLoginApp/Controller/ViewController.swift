//
//  ViewController.swift
//  FBLoginApp
//
//  Created by Eissa on 9/29/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import JGProgressHUD
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var fbLoginTapped: FBLoginButton!
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = AccessToken.current, !token.isExpired {
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "SecondVC")
                    self.present(vc, animated: true, completion: nil)
                }
            }
        else {
            
            fbLoginTapped.delegate = self
            fbLoginTapped.permissions = ["public_profile", "email"]
        }
    }
    
}

