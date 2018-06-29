//
//  SwiftyFeedbackController.swift
//  SwiftyFeedback
//
//  Created by Juan Pablo on 6/28/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import Photos
import MessageUI

internal class SwiftyFeedbackViewController: UITableViewController {
    
    // MARK: Cells
    
    private var topicCell: UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: nil)
    private var feedbackCell: FeedbackTableViewCell = FeedbackTableViewCell()
    private var attachmentCell: UITableViewCell = UITableViewCell()
    private var deviceCell: UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: nil)
    private var iosCell: UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: nil)
    private var nameCell: UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: nil)
    private var versionCell: UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: nil)
    private var buildCell: UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: nil)
    
    
    // MARK: Variables
    
    private var imagePicker = UIImagePickerController()
    private var attachments: [UIImage] = []
    private var selectedAttachment: IndexPath = IndexPath(row: 1, section: 1)
    private var email: EmailModel = EmailModel()
    

    // MARK: Setup
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableViewSetup()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setup() {
        title = "Contact Us"
        UIApplication.shared.statusBarStyle = .default
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(sendEmail))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleDismiss))
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableViewContentOffsetForTextView), name: Notification.Name("UpdatedFeedbackTextView"), object: nil)
    }
    
    @objc private func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func sendEmail() {
        email.attachments = attachments
        email.subject = "\(email.appName) - \(topicCell.detailTextLabel!.text!)"
        email.body = feedbackCell.textView.text
        composeEmail()
    }
    
    
    // MARK: TableView Setup
    
    private func tableViewSetup() {
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.keyboardDismissMode = .onDrag
        
        let cells = [topicCell, feedbackCell, attachmentCell, deviceCell, iosCell, nameCell, versionCell, buildCell]
        let cellsText = ["Select topic", "" , "Attach Photo", "Device", "iOS", "Name", "Version", "Build"]
        
        for index in cells.indices {
            let cell = cells[index]
            cell.selectionStyle = .none
            cell.textLabel?.text = cellsText[index]
        }
        
        topicCell.detailTextLabel?.text = "Question"
        topicCell.accessoryType = .disclosureIndicator
        topicCell.selectionStyle = .default
        
        attachmentCell.accessoryType = .disclosureIndicator
        attachmentCell.selectionStyle = .default
        
        //Device Info
        deviceCell.detailTextLabel?.text = email.deviceModel
        iosCell.detailTextLabel?.text = email.deviceOs
        
        //App Info
        nameCell.detailTextLabel?.text = email.appName
        versionCell.detailTextLabel?.text = email.appVersion
        buildCell.detailTextLabel?.text = email.appBuild
    }
    
    @objc private func updateTableViewContentOffsetForTextView() {
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
        tableView.updateConstraintsIfNeeded()
    }
    
    
    // MARK: Subject Options
    
    private func presentSubjects() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Question", style: .default, handler: selectedTopic))
        alertController.addAction(UIAlertAction(title: "Request", style: .default, handler: selectedTopic))
        alertController.addAction(UIAlertAction(title: "Bug Report", style: .default, handler: selectedTopic))
        alertController.addAction(UIAlertAction(title: "Other", style: .default, handler: selectedTopic))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func selectedTopic(action: UIAlertAction) {
        guard let text = action.title else { return }
        topicCell.detailTextLabel?.text = text
        email.subject = text
        feedbackCell.placeholderView.text = "Describe your \(text.lowercased())."
    }
    
    
    // MARK: Attachment Options
    
    private func presentAttachmentOptions(indexPath: IndexPath) {
        selectedAttachment = indexPath
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: deleteAttachment))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func deleteAttachment(action: UIAlertAction) {
        tableView.beginUpdates()
        attachments.remove(at: selectedAttachment.row)
        tableView.deleteRows(at: [selectedAttachment], with: .automatic)
        tableView.endUpdates()
    }
}

extension SwiftyFeedbackViewController {
    
    // MARK: Tableview Delegate:
    
    internal override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 1 {
            return UITableViewAutomaticDimension
        }

        return 44.0
    }
    
    // MARK: TableView Datasource
    
    internal override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Topic"
        case 1: return "Attachments"
        case 2: return "Device Info"
        case 3: return "App Info"
        default: fatalError("Unknown section")
        }
    }
    
    internal override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 2
        case 1: return attachments.count + 1
        case 2: return 2
        case 3: return 3
        default: fatalError("Unknown number of sections")
        }
    }
    
    internal override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            presentSubjects()
        } else if indexPath.section == 1 && indexPath.row == attachments.count {
            openPhotos()
        } else if indexPath.section == 1 && indexPath.row != attachments.count {
            presentAttachmentOptions(indexPath: indexPath)
        }
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: return self.topicCell
            case 1: return self.feedbackCell
            default: fatalError("Unknown row in section 0")
            }
        case 1:
            if attachments.count == 0 { return attachmentCell }
            if indexPath.row == attachments.count { return attachmentCell}
            let cell = AttachmentTableViewCell()
            cell.attachmentLabel.text = "Attachment \(indexPath.row + 1)"
            cell.attachmentImageView.image = attachments[indexPath.row]
            return cell
            
        case 2:
            switch(indexPath.row) {
            case 0: return self.deviceCell
            case 1: return self.iosCell
            default: fatalError("Unknown row in section 2")
            }
        case 3:
            switch(indexPath.row) {
            case 0: return self.nameCell
            case 1: return self.versionCell
            case 2: return self.buildCell
            default: fatalError("Unknown row in section 3")
            }
        default: fatalError("Unknown section")
        }
    }
}

extension SwiftyFeedbackViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private func openPhotos() {
        if attachments.count >= 5 { return }
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            attachments.append(pickedImage)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
}

extension SwiftyFeedbackViewController: MFMailComposeViewControllerDelegate {
    
    private func composeEmail() {
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(SwiftyFeedback.shared.recipients)
        composeVC.setSubject(email.subject)
        
        let info = "Device: \(email.deviceModel)\n" + "iOS: \(email.deviceOs)\n" + "App Name: \(email.appName)\n" + "App Version: \(email.appVersion)\n" + "App Build: \(email.appBuild)\n"
        
        let body = "\(email.body)\n\n" + info
        
        composeVC.setMessageBody(body, isHTML: false)
        
        for index in email.attachments.indices {
            let attachment = email.attachments[index]
            composeVC.addAttachmentData(UIImageJPEGRepresentation(attachment, CGFloat(1.0))!, mimeType: "image/jpeg", fileName:  "attachment\(index+1).jpeg")
        }
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    internal func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if result == .sent {
            controller.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        } else {
            controller.dismiss(animated: true, completion: nil)
        }
    }
}




