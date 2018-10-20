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
    var index: Int = 0;
    let allQuestions: QuestionBank = QuestionBank()
    var currentQuestion : Question = Question(text: "", correctAnswer: false)
    
    let TRUE: Int = 1
    let FALSE: Int = 2
    var pickedAnswer: Bool = false;
    
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if(sender.tag == TRUE){
            pickedAnswer = true;
        } else if ( sender.tag == FALSE) {
            pickedAnswer = false;
        }
        checkAnswer()
        
    }
    
    
    func updateUI() {
        currentQuestion  = allQuestions.list[index]
        questionLabel.text = currentQuestion.question
        
    }
    

    func nextQuestion() {
        index += 1
        if(index < allQuestions.list.count) {
           updateUI()
        } else {
            showRestartAlert()
        }
        
    }
    
    
    func checkAnswer() {
        if(pickedAnswer ==  allQuestions.list[index].answer) {
            nextQuestion()
        } else {
            print("Nope...")
        }
    }
    
    
    func startOver() {
       
        self.index = 0
        updateUI()
    }
    
    func showRestartAlert() {
        let alert = UIAlertController(title: "Restart", message: "Restart the questions", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver()
        }
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }

    
}
