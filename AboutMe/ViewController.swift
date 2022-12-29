//
//  ViewController.swift
//  AboutMe
//
//  Created by Tsuyuwou on 12/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numPetsLabel: UILabel!
    @IBOutlet weak var numPetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var DOBPicker: UIDatePicker!
    @IBOutlet weak var kpopTextField: UITextField!
    @IBOutlet weak var introduceSelfButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
          numPetsLabel.text = "\(Int(sender.value))"
      }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let DOB = dateFormatter.string(from: DOBPicker.date)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!). I am a \(year!) at \(schoolNameTextField.text!). I \(numPetsLabel.text! == "0" ? "do not own" : "own \(numPetsLabel.text!)") pet\(numPetsLabel.text! == "1" ? "" : "s"). I\(morePetsSwitch.isOn ? "" : " do not") want more pets. I was born on \(DOB). I am a huge \(kpopTextField.text!) fan."
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
