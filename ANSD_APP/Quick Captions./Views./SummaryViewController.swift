import UIKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Table
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        // Background Color
        view.backgroundColor = .systemGroupedBackground
    }

    // MARK: - Actions
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        print("Share tapped")
    }

    // MARK: - Table Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        // We are only showing the first section (Header) for now
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // SECTION 0: The "Conversation Summary" Header
        // Since we returned 1 section above, this is the only block that will run.
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummarySectionHeaderCell", for: indexPath) as! SummarySectionHeaderCell
        
        // If you connected outlets and want to set them dynamically:
        // cell.headerLabel.text = "Conversation Summary"
        
        return cell
            
        /* // COMMENTED OUT UNTIL OTHER CELLS ARE READY
        } else if indexPath.section == 1 {
            // SECTION 1: The Summary Card
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCardCell", for: indexPath) as! SummaryCardCell
            return cell
            
        } else if indexPath.section == 2 {
            // SECTION 2: Participants Header
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsHeaderCell", for: indexPath) as! ParticipantsHeaderCell
            return cell
            
        } else {
            // SECTION 3: Participant Details
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantDetailCell", for: indexPath) as! ParticipantDetailCell
            cell.initialsLabel.text = "SP"
            cell.detailsLabel.text = "Speaker 1 (56%) spoke for 12 mins. Sentiment: Neutral. Avg pace: 120wpm."
            return cell
        }
        */
    }
}
