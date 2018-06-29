//
//  FeedbackTableViewCell.swift
//  SwiftyFeedback
//
//  Created by Juan Pablo on 6/29/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

internal class FeedbackTableViewCell: UITableViewCell {
    
    var textView: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 17)
        view.sizeToFit()
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var placeholderView: UITextView = {
        let view = UITextView()
        view.text = "Describe your question."
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 17)
        view.sizeToFit()
        view.isScrollEnabled = false
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        //FeedbackTextView Setup
        textView.delegate = self
        self.addSubview(textView)
        let cellMargins = self.layoutMarginsGuide
        textView.leftAnchor.constraint(equalTo: cellMargins.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: cellMargins.rightAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -44).isActive = true
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        
        //Feedback Placeholder
        textView.insertSubview(placeholderView, at: 0)
        placeholderView.isHidden = !textView.text.isEmpty
        textView.leftAnchor.constraint(equalTo: placeholderView.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: placeholderView.rightAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: placeholderView.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor).isActive = true
    }
}

extension FeedbackTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderView.isHidden = !textView.text.isEmpty
        NotificationCenter.default.post(name: Notification.Name("UpdatedFeedbackTextView"), object: nil)
    }
}
