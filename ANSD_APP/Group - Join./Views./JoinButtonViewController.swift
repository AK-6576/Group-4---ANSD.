//
//  NewButtonViewController.swift
//  ANSD_APP
//
//  Created by Anshul Kumaria on 01/12/25.
//

import UIKit

class JoinButtonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newConversationTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Group-Join.", bundle: nil)
        
        if let selectionVC = storyboard.instantiateViewController(withIdentifier: "ParticipantSelectionViewController") as? SessionSelectionViewController {
            
            // USE PUSH (Native iOS Navigation)
            // This automatically gives you the "< Back" button in the top left.
            self.navigationController?.pushViewController(selectionVC, animated: true)
        }
    }
}
