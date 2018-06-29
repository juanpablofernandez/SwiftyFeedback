//
//  EmailModel.swift
//  SwiftyFeedback
//
//  Created by Juan Pablo on 6/28/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class EmailModel {
    
    var subject: String = ""
    var body: String = ""
    var attachments: [UIImage] = []
    
    var deviceModel: String = UIDevice.modelName
    var deviceOs: String = UIDevice.current.systemVersion
    
    var appName: String = Bundle.main.name
    var appVersion: String = Bundle.main.releaseVersionNumber
    var appBuild: String = Bundle.main.buildVersionNumber
}
