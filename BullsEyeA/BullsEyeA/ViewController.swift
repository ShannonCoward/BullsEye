//
//  ViewController.swift
//  BullsEyeA
//
//  Created by Shannon Armon on 5/16/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var targetValue: Int = 0
    var currentValue: Int = 50
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
      let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points 
        
        var title: String
        if difference == 0 {
            title = "Bulls Eye!"
            points += 100
        }   else if difference < 5 {
            title = "Almost had it..."
            if difference == 1 {
                points += 50
            }
        }   else if difference < 10 {
            title = "Pretty Good!"
        } else {
        
            title = "Not even close...."
        }
        
            score += points
        
        let message = "You Landed On: \(currentValue)"
                       + "\nYou Scored \(points) points!"

    
        let alert = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Ok", style: .Default,
            handler: { action in self.startNewRound()
                                 self.updateLabels()
            
            })
        
            alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMoved(slider :UISlider) {
    
       currentValue = lroundf(slider.value)
    }

    func startNewRound() {
        
        round += 1 
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    
    }
    
    func updateLabels() {
        
        targetLabel.text = String(targetValue)
        
        scoreLabel.text = String(score)
        
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        
        score = 0
        round = 0
        startNewRound()
    
    }
    
    @IBAction func startOver() {
        
        startNewGame()
        updateLabels()
    
    }
    
}

