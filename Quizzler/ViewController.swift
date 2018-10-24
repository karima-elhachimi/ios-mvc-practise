//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, QuestionsDataDelegate {
    
    
    //todo: use question api
    
    //Place your instance variables here
   
    var index: Int = 0;
    let allQuestions: QuestionBank = QuestionBank()
    var apiHandler : ApiHandler = ApiHandler()
    var questions = [Question]()

    
    let TRUE: Int = 1
    let FALSE: Int = 2
    var pickedAnswer: Bool = false;
    
    var score: Int = 0
    var jsonData : JSON?
    
   
    
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.apiHandler.delegate = self
        
        
    }
    
    func hasReceivedData(data: [Question]) {
        self.questions = data;
        self.updateUI()
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
        print("updateui started")
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(index+1)/\(self.questions.count)"
        questionLabel.text = self.questions[index].question
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(questions.count)) * CGFloat(index+1);
    }
    

    func nextQuestion() {
        index += 1
        if(index < self.questions.count) {
            updateUI()
        } else {
            showRestartAlert()
        }
        
        
    }
    
    
    func checkAnswer() {
        if(pickedAnswer ==  self.questions[index].answer) {
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

    
    @IBAction func segueToQuestions(_ sender: Any) {
        performSegue(withIdentifier: "goToQuestions", sender: self)
    }
    
}
