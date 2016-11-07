//
//  ViewController.swift
//  GameZone
//
//  Created by alex on 11/5/16.
//  Copyright © 2016 alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var targetValue: Int = 0
    var score: Int = 0
    var round = 0
    var currentValue: Int = 0

    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        
        startNewRound()
    }
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = currentValue
        let alert = UIAlertController(title: "Open web", message: "Slider Value:\(message), Target Value:\(targetValue), you scored \(points)", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "haha", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true,completion: nil)
        startNewRound()
    }

    @IBAction func sliderMoved(slider: UISlider){
        print("Value of the slider: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func reset(){
        score = 0
        round = 0
        startNewRound()
    }
}

