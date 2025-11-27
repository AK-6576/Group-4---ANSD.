//
//  ChatCell.swift
//  Quick Captioning.
//
//  Created by Anshul Kumaria on 25/11/25.
//

import UIKit

class OutgoingCell: UICollectionViewCell {
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // 1. Visuals
            bubbleView.backgroundColor = .systemBlue
            messageLabel.textColor = .white
            bubbleView.layer.cornerRadius = 16
            bubbleView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
            
            // 2. THE FIX: Force the cell width to match the Screen Width
            // This prevents the "Collapse" issue.
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
        }
    }

class IncomingCell: UICollectionViewCell {
    // @IBOutlet weak var avatarImageView: UIImageView!
    //@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var onLabelTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 1. Style
        bubbleView.backgroundColor = .systemGray5
        messageLabel.textColor = .black
        
        // 3. THE FIX: Flip the tail to the Bottom-Left
        bubbleView.layer.cornerRadius = 16
        bubbleView.layer.maskedCorners = [
            .layerMinXMinYCorner, // Top Left (NOW ROUND)
            .layerMaxXMinYCorner, // Top Right (ROUND)
            .layerMaxXMaxYCorner  // Bottom Right (ROUND)
            // Bottom Left is MISSING -> That makes it SHARP (The Tail)
        ]
        
        nameLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        nameLabel.addGestureRecognizer(tap)
        
        
        
        // 4. Layout
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
    }
    @objc func handleTap() { onLabelTapped?() }
}
