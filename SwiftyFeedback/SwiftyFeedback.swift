//
//  SwiftyFeedback.swift
//  SwiftyFeedback
//
//  Created by Juan Pablo on 6/29/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

public class SwiftyFeedback {
    
    static public let shared: SwiftyFeedback = SwiftyFeedback()
    
    public var recipients: [String] = []
    public var title: String = "Contact Us"
    public var sendButtonTitle = "Send"
    public var cancelButtonTitle = "Cancel"
    
    public func present(_ sender: UIViewController) {
        let feedbackVC = UINavigationController(rootViewController: SwiftyFeedbackViewController())
        sender.present(feedbackVC, animated: true, completion: nil)
    }
}
