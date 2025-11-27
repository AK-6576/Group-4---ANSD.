import UIKit

// 1. The Header Cell (Highlighted Part)
class SummarySectionHeaderCell: UITableViewCell {
    @IBOutlet weak var headerIcon: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // No specific styling needed here if done in Storyboard
    }
}

// 2. The Summary Card Cell
/*
 class SummaryCardCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainCardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Card Styling
        if let card = mainCardView {
            card.layer.cornerRadius = 12
            card.layer.shadowColor = UIColor.black.cgColor
            card.layer.shadowOpacity = 0.05
            card.layer.shadowOffset = CGSize(width: 0, height: 2)
            card.layer.shadowRadius = 4
        }
    }
}

// 3. The Participant Detail Cell
class ParticipantDetailCell: UITableViewCell {
    
    @IBOutlet weak var mainCardView: UIView!
    @IBOutlet weak var avatarCircle: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var viewTranscriptButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Card Styling
        if let card = mainCardView {
            card.layer.cornerRadius = 12
            card.backgroundColor = .white
            card.layer.shadowColor = UIColor.black.cgColor
            card.layer.shadowOpacity = 0.05
            card.layer.shadowOffset = CGSize(width: 0, height: 2)
            card.layer.shadowRadius = 4
        }
        
        // Avatar Styling
        if let avatar = avatarCircle {
            avatar.layer.cornerRadius = 20 // Half of width (40)
            avatar.clipsToBounds = true
            avatar.backgroundColor = .systemGray4
        }
        
        // Button Styling
        if let btn = viewTranscriptButton {
            btn.setTitleColor(.systemBlue, for: .normal)
        }
    }*/
