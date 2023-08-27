//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressBar.progress = 0.0
        self.updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = self.quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = 19.0
        } else {
            sender.backgroundColor = UIColor.red
            sender.layer.cornerRadius = 19.0
        }
        
        self.quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        self.questionLabel.text = self.quizBrain.getQuestionText()
        self.progressBar.progress = self.quizBrain.getProgress()
        self.scoreLabel.text = "Score: \(self.quizBrain.getScore())"
        let answers = self.quizBrain.getAnswersToCurrentQuestion()
        self.answerAButton.setTitle(answers[0], for: UIControl.State.normal)
        self.answerBButton.setTitle(answers[1], for: UIControl.State.normal)
        self.answerCButton.setTitle(answers[2], for: UIControl.State.normal)
        answerAButton.backgroundColor = UIColor.clear
        answerBButton.backgroundColor = UIColor.clear
        answerCButton.backgroundColor = UIColor.clear
    }
}

