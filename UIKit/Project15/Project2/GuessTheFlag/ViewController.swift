//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Anuj Rajput on 30/07/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " | Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String = ""
        var continueGame: String = "Continue"
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 4, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { finished in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 4, options: [], animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        
        questionsAsked += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            message = "That’s the flag of \(countries[sender.tag].uppercased()) \n"
            score -= 1
        }
        
        if questionsAsked <= 10 {
            message += "Your score is \(score)"
        } else {
            message += "Final score is \(score)"
            continueGame = "Restart"
            score = 0
            questionsAsked = 1
        }
                
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: continueGame, style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

