//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var selectedAnswer: Bool = false
    var questionNumber: Int = 0
    var gameState: Int = 0
    var correctAnswers: Int = 0
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    // Core game logic - occurs when a button is tapped
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        // Find out if the user tapped True or False
        if (sender.tag == 1){
            selectedAnswer = true
        }else if(sender.tag == 2){
            selectedAnswer = false
        }
        
        // Check the users answer against the question
        checkAnswer()
        
        // Increment the question number
        questionNumber += 1
        
        // Display the next question
        nextQuestion()
        
    }
    
    
    // This function updates UI elements such as the progress bar and score
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    // Check if there's another question. If yes, display the new question onscreen.
    // Otherwise, show the 'Game Over' alert
    func nextQuestion() {
        if(questionNumber < allQuestions.list.count){
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else{
            let alert = UIAlertController(title: "Game Over", message: "You got \(correctAnswers) out of \(allQuestions.list.count) correct.", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default,
                                              handler: {(UIAlertAction) in self.startOver()})
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // Check if the user's answer is correct.
    func checkAnswer(){
        if(selectedAnswer == allQuestions.list[questionNumber].answer){
            ProgressHUD.showSuccess("Correct")
            correctAnswers += 1
            score += 1
        }else{
            ProgressHUD.showError("Incorrect")
        }
    }
    
    // Restart the game, set the question and correct answer counts to 0
    func startOver() {
        print("Restarting game")
        questionNumber = 0
        correctAnswers = 0
        score = 0
        nextQuestion()
    }
    
}//end ViewController
