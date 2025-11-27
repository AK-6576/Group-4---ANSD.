//
//  RoutineViewController.swift
//  ANSD_APP
//
//  Created by Dhiraj Bodake on 27/11/25.
//

import UIKit

class RoutineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   
    @IBOutlet weak var tableView: UITableView!
    
    // The Controller holds the data
    var routineList: [RoutineItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Navigation Bar Setup
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        // 2. Table View Setup
        setupTableView()
        
        // 3. Load Data
        loadData()
        // CRITICAL: This allows the cell to grow if text is large or padding is added
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        // Remove extra top/bottom padding and align separators
        tableView.contentInset = .zero
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.separatorStyle = .singleLine

    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.cellLayoutMarginsFollowReadableWidth = false
        
        // Removes empty lines at bottom
        tableView.tableFooterView = UIView()
    }
        
    func loadData() {
        self.routineList = RoutineRepository.getMockData()
        tableView.reloadData()
    }
    
    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineList.count
    }
    
    // Fix row height for consistent spacing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    // Remove extra spacing between sections (even if there's only one)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineCell", for: indexPath) as? RoutineTableViewCell else {
            return UITableViewCell()
        }
        
        let item = routineList[indexPath.row]
        
        // Populate the view
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.time
        
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
        
        return cell
    }


}
