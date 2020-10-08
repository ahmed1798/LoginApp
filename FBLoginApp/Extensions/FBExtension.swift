//
//  Sparkervice.swift
//  FBLoginApp
//
//  Created by Eissa on 10/1/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import JGProgressHUD
import SwiftyJSON

class FBServices {
    
    // MARK: -
    // MARK: Logout
     static func logout(completion: @escaping (_ result: Bool, _ error: Error?) ->()) {
        do {
            print("Successfully signed out")
            completion(true, nil)
        } catch let err {
            print("Failed to sign out with error:", err)
            completion(false, err)
        }
    }
}

extension ViewController: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        if let err = error {
            print("Error = \(err)")
        }

        // Mark: - GraphRequest to fetch user data...
        let token = result?.token?.tokenString
        hud.textLabel.text = "Signing in with Facebook..."
        hud.show(in: view)
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields": "id, email, name, picture.type(large)"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start { (connection, result, error) in
            Alert.dismissHud(self.hud, text: "Success", detailText: "Successfully signed in with facebook", delay: 3)
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                print("\(result)")
                // Mark:- parse json data...
                let json = JSON(result)
                let name = json["name"].string ?? ""
                let email = json["email"].string ?? ""
                let id = json["id"].string ?? ""
                let imageURL = json["picture"]["data"]["url"].string ?? ""
                print("Name = \(name), Email = \(email), ID = \(id), ImageURL = \(imageURL)")
                // Mark: - save data in user defaults...
                helper.saveData(name: name, profileImage: imageURL, email: email, id: id)
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "SecondVC")
                    self.present(vc, animated: true, completion: nil)
                }
            })
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
}
