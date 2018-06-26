//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var selectedAnswer: Bool = false
    var questionNumber: Int = 0
    var gameState: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1){
            selectedAnswer = true
        }else if(sender.tag == 2){
            selectedAnswer = false
        }
        
        checkAnswer(userAnswer: selectedAnswer)
        questionNumber += 1
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func Bool checkAnswer(userAnswer: Bool) -> Bool {
        if(userAnswer == allQuestions.list[0].answer){
            return true
        }else{
            return false
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
