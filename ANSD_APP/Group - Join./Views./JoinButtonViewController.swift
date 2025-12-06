//
//  JoinButtonViewController.swift
//  ANSD_APP
//
//  Created by Anshul Kumaria on 01/12/25.
//

import UIKit

class JoinButtonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func joinConversationTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Group-Join.", bundle: nil)
        
        if let selectionVC = storyboard.instantiateViewController(withIdentifier: "ParticipantSelectionViewController") as? SessionSelectionViewController {
            self.navigationController?.pushViewController(selectionVC, animated: true)
        }
    }
}
