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

    
    let TRUE: Int = 1
    let FALSE: Int = 2
    var pickedAnswer: Bool = false;
    
    var score: Int = 0
    
   
    
    
    
    
    
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
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(index+1)/\(allQuestions.list.count)"
        questionLabel.text = allQuestions.list[index].question
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(index+1);
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
            score += 1
            ProgressHUD.showSuccess("Correct!")
            nextQuestion()
        } else {
            ProgressHUD.showError("False!")
            nextQuestion()
        }
    }
    
    
    func startOver() {
       
        self.index = -1
        nextQuestion()
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
