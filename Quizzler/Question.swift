//
//  Question.swift
//  Quizzler
//
//  Created by Karima on 18/10/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        self.question = text
        self.answer = correctAnswer
    }
    
    
}
