//
//  ViewController.swift
//  Prework
//
//  Created by Geo Aldana on 2/3/21.
//

import UIKit

class Settings {
    static let sharedInstance = Settings()
    var backgroundColor = UIColor.white // set to white by default.
}

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var billAmountText: UILabel!
    @IBOutlet weak var tipAmountText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var numberofPeopleLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var numberofPeopleSlider: UISlider!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var totalPercentTip: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
    }
    @IBAction func darkMode(_ sender: Any) {
        if darkModeSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            tipAmountLabel.textColor = UIColor.white
            billAmountTextField.textColor = UIColor.white
            billAmountText.textColor = UIColor.white
            tipAmountText.textColor = UIColor.white
            totalText.textColor = UIColor.white
            tipControl.backgroundColor = UIColor.white
            totalLabel.textColor = UIColor.white
            billAmountTextField.backgroundColor = UIColor.gray
            tipControl.backgroundColor = UIColor.lightGray
            tipPercentageLabel.textColor = UIColor.white
            numberofPeopleLabel.textColor = UIColor.white
            totalPerPerson.textColor = UIColor.white
            perPersonLabel.textColor = UIColor.white
            totalPercentTip.textColor = UIColor.white
            peopleLabel.textColor = UIColor.white
            
        }
        else {
            view.backgroundColor = UIColor.systemYellow
            tipAmountLabel.textColor = UIColor.black
            billAmountTextField.textColor = UIColor.black
            billAmountText.textColor = UIColor.black
            tipAmountText.textColor = UIColor.black
            totalText.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            billAmountTextField.backgroundColor = UIColor.systemTeal
            tipControl.backgroundColor = UIColor.systemTeal
            tipPercentageLabel.textColor = UIColor.black
            numberofPeopleLabel.textColor = UIColor.black
            totalPerPerson.textColor = UIColor.black
            perPersonLabel.textColor = UIColor.black
            totalPercentTip.textColor = UIColor.black
            peopleLabel.textColor = UIColor.black
            
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercenteges = [0.15, 0.18, 0.2]
        let tip = bill * tipPercenteges[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func calculations() {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercent = tipSlider.value
        let tipPercentDisplay = tipSlider.value * 100
        let total = bill * Double(tipPercent)
        tipAmountLabel.text = String(format: "$%.2f", total)
        let mainTotal = bill + total
        totalLabel.text = String(format: "$%.2f", mainTotal)
        let numPeople = Int(numberofPeopleSlider.value)
        peopleLabel.text = String(numPeople)
        totalPerPerson.text = String(format: "$%.2f", mainTotal/Double(numPeople))
        totalPercentTip.text = String(format: "%.2f", tipPercentDisplay) + "% Tip"
    }
    @IBAction func tipSlider(_ sender: Any) {
        calculations()
    }
    @IBAction func numPeopleSlider(_ sender: Any) {
        calculations()
    }
}

