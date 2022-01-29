//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        progressBar.progress = 0
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.shortChangeTo(UIColor.green)
        }
        else {
            sender.shortChangeTo(UIColor.red)
        }
        
        quizBrain.nextQuestion()
        
        updateUI()
    }

        
    @objc func updateUI(){
        answerOne.setTitle(quizBrain.getAnswerOne(),for: .normal)
        answerTwo.setTitle(quizBrain.getAnswerTwo(),for: .normal)
        answerThree.setTitle(quizBrain.getAnswerThree(),for: .normal)
        questionView.text = quizBrain.getText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
}

extension UIButton {
  func shortChangeTo(_ color:UIColor) {
    let prev = self.backgroundColor
    self.backgroundColor = color
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
       self.backgroundColor = prev
    }
  }
}

