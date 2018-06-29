//
//  ViewController.swift
//  Example
//
//  Created by Juan Pablo on 6/29/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyFeedback

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func contactTapped(_ sender: Any) {
        SwiftyFeedback.shared.present(self)
    }
}

