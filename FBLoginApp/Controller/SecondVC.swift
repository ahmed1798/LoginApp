//
//  SecondVC.swift
//  FBLoginApp
//
//  Created by Eissa on 9/29/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import JGProgressHUD
import Kingfisher

class SecondVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let logoutFB = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    // Mark:- load user data
    func loadData() {
        let name = UserDefaults.standard.object(forKey: "name")
        let email = UserDefaults.standard.object(forKey: "email")
        let imageURL = UserDefaults.standard.object(forKey: "profileImage")
        self.nameLabel.text = name as? String ?? ""
        self.emailLabel.text = email as? String ?? ""
        self.profileImg.kf.indicatorType = .activity
        let url = URL(string: imageURL as? String ?? "")
        self.profileImg.kf.setImage(with: url)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        // Mark: - log out from facebook account
        FBServices.logout { (result, err) in
            self.logoutFB.logOut()
            if let error = err {
                // show custom Alert with error
                print("failed to signed out with facebook \(error.localizedDescription)")
                return
            }
            if result {
                AccessToken.current = nil
                Profile.current = nil
                UserDefaults.standard.removeObject(forKey: "name")
                UserDefaults.standard.removeObject(forKey: "email")
                UserDefaults.standard.removeObject(forKey: "id")
                UserDefaults.standard.removeObject(forKey: "profileImage")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    }
                }
            else {
            }
        }
    }
}
