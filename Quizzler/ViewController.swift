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
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentQuestion : Question = allQuestions.list[index]
        questionLabel.text = currentQuestion.question
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
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        if(pickedAnswer ==  allQuestions.list[index].answer) {
            print("You got it")
        } else {
            print("Nope...")
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
