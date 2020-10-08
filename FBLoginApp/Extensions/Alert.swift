//
//  Alert.swift
//  FBLoginApp
//
//  Created by Eissa on 10/1/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import JGProgressHUD

class Alert {
    // MARK: -
    // MARK: dismiss hud
    static func dismissHud(_ hud: JGProgressHUD, text: String, detailText: String, delay: TimeInterval) {
        DispatchQueue.main.async {
            hud.textLabel.text = text
            hud.detailTextLabel.text = detailText
            hud.dismiss(afterDelay: delay, animated: true)
        }
    }
}

