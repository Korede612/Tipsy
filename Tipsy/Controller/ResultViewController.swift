//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Oko-osi Korede on 29/01/2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    var amount: String?
    var info: String?
    
    @IBOutlet weak var tipsAmountLabel: UILabel!
    @IBOutlet weak var tipsInfoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tipsAmountLabel.text = amount
        tipsInfoLabel.text = info
    }
    
    @IBAction func recalculateTipsTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
