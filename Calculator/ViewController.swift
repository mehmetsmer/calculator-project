//
//  ViewController.swift
//  Calculator
//
//  Created by Mehmet Sümer on 24.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var newNumber: Double = 0
    var previousNumber: Double = 0
    var performingMath: Bool = true
    var operation = 0

    @IBOutlet var label: UILabel!

    @IBAction func numbers(_ sender: UIButton) {

        if performingMath == true {
            label.text = String(sender.tag)
            newNumber = Double(label.text!)!
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag)
            newNumber = Double(label.text!)!
        }

    }

    @IBAction func calculate(_ sender: UIButton) {
        if label.text != "" && sender.tag != 15 && sender.tag != 14 {
            if Double(label.text!) != nil {
                previousNumber = Double(label.text!)!
            }
            if sender.tag == 10 { // Divide
                label.text = "/"
            }
            if sender.tag == 11 { // Multiply
                label.text = "*"
            }
            if sender.tag == 12 { // Minus
                label.text = "-"
            }
            if sender.tag == 13 { // Plus
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 14 {
            if operation == 10 {
                label.text = String(previousNumber / newNumber)
            }
            else if operation == 11 {
                label.text = String(previousNumber * newNumber)
            }
            else if operation == 12 {
                label.text = String(previousNumber - newNumber)
            }
            else if operation == 13 {
                label.text = String(previousNumber + newNumber)
            }
        }
        else if sender.tag == 15 {
            label.text = ""
            previousNumber = 0
            newNumber = 0
            operation = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
