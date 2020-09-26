//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Manoel Filho on 24/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(question: String, answers: [String], correctAnswer: String ) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
