//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bailey Search on 29/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var price: String?
    var settings: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = price
        settingsLabel.text = settings
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
