//
//  SessionSelectionViewController.swift
//  ANSD_APP
//
//  Created by Anshul Kumaria on 01/12/25.
//

import UIKit

class SessionSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Data
    let sessions: [SessionModel] = [
        SessionModel(title: "UI/UX Design Session", subtitle: "Reed Richards"),
        SessionModel(title: "Project Alpha X7", subtitle: "Bruce Wayne"),
        SessionModel(title: "Starbucks Meetup", subtitle: "Andrew Garfield"),
        SessionModel(title: "Assignment Completion", subtitle: "Peter Parker")
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.tableFooterView = UIView()
    }

    // MARK: - Navigation (THE FIX)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChat" {
            if let chatVC = segue.destination as? GroupJoinViewController {
                chatVC.modalPresentationStyle = .fullScreen
                
                if let sessionData = sender as? SessionModel {
                    chatVC.sessionTitle = sessionData.title
                }
            }
        }
    }

    // MARK: - TableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground
        let label = UILabel()
        label.text = "Nearby Sessions"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10)
        ])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let session = sessions[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = session.title
        content.textProperties.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        content.secondaryText = session.subtitle
        content.secondaryTextProperties.color = .secondaryLabel
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // MARK: - Selection Logic (THE FIX)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSession = sessions[indexPath.row]
        
        performSegue(withIdentifier: "goToChat", sender: selectedSession)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
