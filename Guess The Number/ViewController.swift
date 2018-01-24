//
//  ViewController.swift
//  Guess The Number
//
//  Created by Brett Davis on 1/23/18.
//  Copyright © 2018 Brett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    let lowerBound : UInt32 = 1
    //UInt32 == unsigned int of 32 bits
    let upperBound : UInt32 = 100
    var numberToGuess : UInt32 = 0
    var numberOfGuesses = 0
    
    func validateGuess(guess: Int) {
        if (guess > upperBound || guess < lowerBound) {
            UIAlert(message: "Your number's invalid. it should be between"
                \(lowerBound) "and" \(upperBound)),
            buttonText: "OK")
        } else if (guess < numberToGuess) {
            print("guess higher ⬆️")
        } else if (guess < numberToGuess) {
            print("guess lower ↓")
        } else {
            print("you win!")
            showAlert(title: "Congrats!", message: "You win with \
                (numberOfGuesses) guesses!" , buttonText: <#T##String#>)
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if let guess = guessTextField.text {
            if let guessedInt = Int(guess) {
                validateGuess(guessedInt)
                print(guessedInt)
            }
        }
    }
    
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func generateRandomNumber() {
        numberToGuess = (arc4random_uniform(upperBound)) + lowerBound
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomNumber()
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

