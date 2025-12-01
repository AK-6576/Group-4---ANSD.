//
//  QRCodeViewController.swift
//  ANSD_APP
//
//  Created by Anshul Kumaria on 01/12/25.
//

import UIKit
import CoreImage.CIFilterBuiltins

class QRCodeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var shareLinkButton: UIButton!
    
    // Data Variables
    var inviteCode: String = ""
    
    // A "Trigger" function to notify the previous screen when we leave
    var onDismiss: (() -> Void)?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        generateAndShowQR()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Style the button
        shareLinkButton.layer.cornerRadius = 25
        shareLinkButton.backgroundColor = .black
        shareLinkButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - QR Generation
    func generateAndShowQR() {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = inviteCode.data(using: .ascii)
        
        filter.setValue(data, forKey: "inputMessage")
        
        // Scale up (QR codes are tiny by default, we make it crisp)
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        if let output = filter.outputImage?.transformed(by: transform) {
            if let cgImage = context.createCGImage(output, from: output.extent) {
                qrImageView.image = UIImage(cgImage: cgImage)
            }
        }
    }

    // MARK: - Actions
    
    // 1. Share Link Button (Inside the QR Screen)
    @IBAction func shareLinkTapped(_ sender: Any) {
        let textToShare = "Join my Quick Caption conversation! Code: \(inviteCode)"
        
        let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        
        // When this internal share sheet closes, we dismiss the QR screen too
        activityVC.completionWithItemsHandler = { _, _, _, _ in
            self.dismiss(animated: true) {
                // Tell parent to start the chat
                self.onDismiss?()
            }
        }
        
        present(activityVC, animated: true)
    }
    
    // 2. Cancel / Close Button (If you added an X button)
    // If you don't have a button and just swipe down,
    // we need to handle viewWillDisappear to be safe,
    // but typically a button is better for flow control.
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true) {
            self.onDismiss?()
        }
    }
    
    // 3. Handle Swipe Down dismissal
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // If the view is gone, trigger the callback
        // (This covers the swipe-down gesture)
        if isBeingDismissed {
            onDismiss?()
        }
    }
}
