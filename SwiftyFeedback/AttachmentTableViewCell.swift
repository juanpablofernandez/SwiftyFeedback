//
//  AttachmentTableViewCell.swift
//  SwiftyFeedback
//
//  Created by Juan Pablo on 6/28/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

internal class AttachmentTableViewCell: UITableViewCell {
    
    var attachmentImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var attachmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        //ImageView
        self.addSubview(attachmentImageView)
        attachmentImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        attachmentImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        attachmentImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        attachmentImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //Label
        self.addSubview(attachmentLabel)
        attachmentLabel.leftAnchor.constraint(equalTo: attachmentImageView.rightAnchor, constant: 10).isActive = true
        attachmentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        attachmentLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        attachmentImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
}
