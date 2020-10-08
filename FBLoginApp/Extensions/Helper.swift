//
//  Config.swift
//  FBLoginApp
//
//  Created by Eissa on 10/1/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
class helper: NSObject {
    
    // Mark:- save data in user defaults
    class func saveData(name: String, profileImage: String, email: String, id: String) {
        let def = UserDefaults.standard
        def.setValue(name, forKeyPath: "name")
        def.setValue(profileImage, forKeyPath: "profileImage")
        def.setValue(id, forKeyPath: "id")
        def.set(email, forKey: "email")
        def.synchronize()
    }
    // Mark:- get data from user defaults
    class func getData() -> Any {
        let def = UserDefaults.standard
        return def.object(forKey: "name") as? String
        return def.object(forKey: "profileImage") as? String
        return def.object(forKey: "email") as? String
         return def.object(forKey: "id") as? String
    }
}
