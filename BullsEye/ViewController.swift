//
//  ViewController.swift
//  BullsEye
//
//  Created by Mikhail Chukhvantsev on 23/03/2019.
//  Copyright © 2019 Mikhail Chukhvantsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var rounds = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundsLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        refresh()
      
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
      
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
      
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
      
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
      
      }
  
    @IBAction func showAlert() {
      
      let difference = abs(targetValue - currentValue)
      var points = 100 - difference
      
      let title: String
      if difference == 0 {
        title = "Идеально!"
        points += 100
      } else if difference < 5 {
        title = "Почти идеально!"
        if difference == 1 {
          points += 50
        }
      } else if difference < 10 {
        title = "Неплохо!"
      } else {
        title = "Ну чёт такое себе..."
      }
      
      score += points
      
      let message = "Вы набрали \(points) очков"
    
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
      let action = UIAlertAction(title: "Закрыть", style: .default, handler: {
        action in
        self.startNewRound()
      })
      
      alert.addAction(action)
      
      present(alert, animated: true, completion: nil)
      
    }
  
    @IBAction func sliderMoved(_ slider: UISlider) {
      let roundedValue = slider.value.rounded()
      currentValue = Int(roundedValue)
    }
  
    func startNewRound() {
      rounds += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
      updateLabels()
    }
  
    func updateLabels() {
      targetLabel.text = String(targetValue)
      scoreLabel.text = String(score)
      roundsLabel.text = String(rounds)
    }
  
  @IBAction func refresh() {
    score = 0
    rounds = 0
    startNewRound()
  }
  


}

