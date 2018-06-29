//
//  AppDelegate.swift
//  Example
//
//  Created by Juan Pablo on 6/29/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyFeedback

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        SwiftyFeedback.shared.recipients = ["test@gmail.com"]
        return true
    }
}

