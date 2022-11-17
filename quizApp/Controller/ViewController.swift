//
//  ViewController.swift
//  quizApp
//
//  Created by Kiran Kishore on 13/07/19.
//  Copyright © 2019 CDNS. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    var allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var progresBar: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
        updateUI()
    }
    
    //MARK: FUNCTION TO UPDATE THE QUESTIONS, SCORE/PROGRESS LABELS AFTER EACH BUTTON PRESS
    func updateUI() {
        //print("UIupdate called")
        progressLabel.text = "\(questionNumber)/13"
        scoreLabel.text = "Score : \(score)"
        progresBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
    }
    
    //MARK: FUNCTION TO LOAD NEXT QUESTION
    func nextQuestion() {
        //print("nextQuestion called")
        
        if questionNumber <= 12   {
            print("nextQuestion called")
            questionLabel.text = allQuestions.qList[questionNumber].questionText
            questionNumber = questionNumber + 1
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "End Of Quiz \nYour Score is \(score)", message: "Do you wish to restart the quiz?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: FUNCTION TO CHECK ANSWER
    func checkAnswer() {
        
        if questionNumber <= 12{
            let correctAnswer = allQuestions.qList[questionNumber].answer
            if pickedAnswer == correctAnswer {
                
                let alert = UIAlertController(title: "Right Answer!!!", message: "", preferredStyle: .alert)
                
                present(alert, animated: true, completion: nil)
                
                print("Right Answer!!!")
                score = score + 1
                alert.dismiss(animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Wrong Answer!!!", message: "", preferredStyle: .alert)
                
                present(alert, animated: true, completion: nil)
                
                print("Wrong Answer!!!")
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    //MARK: FUNCTION TO RESTART QUIZ
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
        
        print("Quiz restart")
    }
    
    
    
}

