//
//  ViewController.swift
//  Project2
//
//  Created by cali on 9/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var totalAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = "\(countries[correctAnswer].uppercased()) | Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[correctAnswer])"
            score -= 1
        }
        totalAnswered += 1;
        
        var message: String
        if totalAnswered >= 10 {
            message = "Your final score is \(score)"
        } else {
            message = "Your score is \(score)"
        }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: totalAnswered >= 10 ? "New Game" : "Continue", style: .default, handler: askQuestion))
        
        if totalAnswered >= 10 {
            score = 0;
            totalAnswered = 0;
        }
        
        present(ac, animated: true)
    }
}

