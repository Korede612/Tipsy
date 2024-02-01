//
//  ViewController.swift
//  Tipsy
//
//  Created by Oko-osi Korede on 29/01/2024.
//

import UIKit

class TipsViewController: UIViewController {
    
    var tipBrain = TipsBrain()
    @IBOutlet weak var tipsAmount: UITextField!
    @IBOutlet weak var splitIntoLabel: UILabel!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipsAmount.delegate = self
        configureDismissKeyBoard()
    }
    
    func configureDismissKeyBoard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    @IBAction func tipPercentTapped(_ sender: UIButton) {
        clearSelectedButton()
        sender.isSelected = true
    }
    
    @objc private func handleTap() {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateTipsTapped(_ sender: UIButton) {
        guard let tips = tipsAmount.text,
              let amount = Float(tips),
              let splitInto = splitIntoLabel.text,
              let numberOfPeople = Float(splitInto)
        else {
            return
        }
        if zeroPercentButton.isSelected {
            tipBrain.calculateTipsPerPerson(n: numberOfPeople, a: amount, p: 0.0)
        } else if tenPercentButton.isSelected {
            tipBrain.calculateTipsPerPerson(n: numberOfPeople, a: amount, p: 0.1)
        } else if twentyPercentButton.isSelected {
            tipBrain.calculateTipsPerPerson(n: numberOfPeople, a: amount, p: 0.2)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else {
            return
        }
        destinationVC.amount = tipBrain.getTipsPerPerson()
        destinationVC.info = tipBrain.getTipsInfo()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        splitIntoLabel.text = String(format: "%.0f", sender.value)
    }
    
    func clearSelectedButton() {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
}

extension TipsViewController: UITextFieldDelegate {
    // Implement UITextFieldDelegate method to dismiss the keyboard when 'Return' key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

