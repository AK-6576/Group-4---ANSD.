//
//  NewButtonViewController.swift
//  ANSD_APP
//
//  Created by Anshul Kumaria on 01/12/25.
//

import UIKit

class NewButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func newConversationTapped(_ sender: UIButton) {
        showInviteMenu()
    }

    // MARK: - Navigation Logic
    func navigateToChat() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let chatVC = storyboard.instantiateViewController(withIdentifier: "GroupNewViewController") as? GroupNewViewController {
            chatVC.modalPresentationStyle = .fullScreen
            chatVC.modalTransitionStyle = .crossDissolve
            self.present(chatVC, animated: true)
        }
    }

    // MARK: - The Menu (iPhone Style Bottom Sheet)
    func showInviteMenu() {
        
        // Style .actionSheet automatically slides from bottom on iPhone
        let actionSheet = UIAlertController(title: "Start New Conversation", message: "Choose an invite method", preferredStyle: .actionSheet)

        // Option A: Share Link
        let shareAction = UIAlertAction(title: "Share Invite Link", style: .default) { _ in
            self.shareSystemLink()
        }
        
        // Option B: Show QR Code
        let qrAction = UIAlertAction(title: "Show QR Code", style: .default) { _ in
            self.showQRCodeScreen()
        }

        // Option C: Cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        actionSheet.addAction(shareAction)
        actionSheet.addAction(qrAction)
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true)
    }
    
    // MARK: - Helper 1: System Share
    func shareSystemLink() {
        let code = "QC-\(UUID().uuidString.prefix(6))"
        let text = "Join my Quick Caption conversation! Code: \(code)"
        
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        // Go to chat when done
        activityVC.completionWithItemsHandler = { _, _, _, _ in
            self.navigateToChat()
        }
        
        present(activityVC, animated: true)
    }
    
    // MARK: - Helper 2: QR Code Screen
    func showQRCodeScreen() {
        let storyboard = UIStoryboard(name: "Group-New.", bundle: nil)
        
        if let qrVC = storyboard.instantiateViewController(withIdentifier: "QRCodeViewController") as? QRCodeViewController {
            
            qrVC.inviteCode = "QC-\(UUID().uuidString.prefix(6))"
            
            // Callback: Go to chat when QR screen closes
            qrVC.onDismiss = { [weak self] in
                self?.navigateToChat()
            }
            
            // Present as Page Sheet (Standard iPhone Card)
            qrVC.modalPresentationStyle = .pageSheet
            if let sheet = qrVC.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
            
            present(qrVC, animated: true)
        }
    }
}
