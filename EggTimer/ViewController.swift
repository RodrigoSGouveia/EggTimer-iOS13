//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var cookingLabel: UILabel!
	let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
	var totalTime = 0
	var secondsPassed = 0
	var timerCountdown = Timer()
	
	
	
	@IBAction func keyPressed(_ sender: UIButton) {
		let hardness = sender.currentTitle!
		totalTime = 0
		secondsPassed = 0
		cookingLabel.text = "Cooking a \(hardness) egg:"
		timerCountdown.invalidate()
		totalTime = eggTimes[hardness]!
		timerCountdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)

	}

	@objc func countdown(){
		if secondsPassed < totalTime {
			secondsPassed += 1
			progressBar.progress = Float(secondsPassed) / Float(totalTime)
	
		} else {
			timerCountdown.invalidate()
			cookingLabel.text = "DONE"
		}
	}
	
}
