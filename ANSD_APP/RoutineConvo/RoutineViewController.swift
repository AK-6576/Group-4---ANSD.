//
//  RoutineViewController.swift
//  ANSD_APP
//
//  Created by Dhiraj Bodake on 27/11/25.
//

import UIKit

class RoutineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Force the Navigation Controller to allow large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 2. Force this specific screen to use them
        navigationItem.largeTitleDisplayMode = .always
    }

}
