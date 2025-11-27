//
//  SummaryCells.swift
//  Quick Captioning
//
//  Created by Anshul Kumaria on 25/11/25.
//

import UIKit

// MARK: - 1. Protocols & Data Models
protocol NotesCardCellDelegate: AnyObject {
    func didUpdateText(in cell: NotesCardCell)
}

// MARK: - 2. Shared Helper for Styling
private func styleCard(view: UIView?) {
    guard let card = view else { return }
    card.layer.cornerRadius = 12
    card.backgroundColor = .white
    
    // Shadow Styling
    card.layer.shadowColor = UIColor.black.cgColor
    card.layer.shadowOpacity = 0.05
    card.layer.shadowOffset = CGSize(width: 0, height: 2)
    card.layer.shadowRadius = 4
}

// MARK: - 3. Header Cells

// Used for "Conversation Summary" and "Notes"
class SummarySectionHeaderCell: UITableViewCell {
    @IBOutlet weak var headerIcon: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
}

// Used for "Participants Summary"
class ParticipantsSummaryHeaderCell: UITableViewCell {
    @IBOutlet weak var participantIcon: UIImageView!
    @IBOutlet weak var participantLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
}

// MARK: - 4. Content Cards

// Conversation Details Card
class SummaryCardCell: UITableViewCell {
    @IBOutlet weak var mainCardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // --- RESTORED TO PREVENT CRASH ---
    // Even if you don't use them, these must exist if Storyboard is connected
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    // ---------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        styleCard(view: mainCardView)
    }
}

// Participant Details Card (Dynamic)
class ParticipantCardCell: UITableViewCell {
    @IBOutlet weak var mainCardView: UIView!
    @IBOutlet weak var avatarCircle: UIView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel! // Make sure this is connected!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        styleCard(view: mainCardView)
        
        avatarCircle.layer.cornerRadius = 4
        avatarCircle.clipsToBounds = true
    }
    
    func configure(with data: ParticipantData) {
        // Safe check in case label isn't connected yet
        if let label = initialsLabel {
            label.text = data.initials
        }
        detailsLabel.text = data.summary
    }
}

// Notes Input Card (Interactive)
class NotesCardCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var mainCardView: UIView!
    @IBOutlet weak var notesTextView: UITextView!
    
    weak var delegate: NotesCardCellDelegate?
    let placeholderText = "Add your notes about this conversation..."
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        styleCard(view: mainCardView)
        
        notesTextView.delegate = self
        notesTextView.text = placeholderText
        notesTextView.textColor = .lightGray
        notesTextView.font = UIFont.systemFont(ofSize: 15)
        
        // CRITICAL: Disabling scroll allows Auto Layout to expand the cell height
        notesTextView.isScrollEnabled = false
        notesTextView.textContainerInset = .zero
        notesTextView.textContainer.lineFragmentPadding = 0
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        delegate?.didUpdateText(in: self)
    }
}
