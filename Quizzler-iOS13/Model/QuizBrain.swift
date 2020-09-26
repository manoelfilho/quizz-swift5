//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Manoel Filho on 24/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz: [Question] = [
        Question(question: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], correctAnswer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(question: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(question: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber: Int = 0
    
    var correctAnsweres: Int = 0
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        if answer == quiz[questionNumber].correctAnswer {
            correctAnsweres += 1
            print(correctAnsweres)
            return true
        }else{
            return false
        }
    }
    
    func getQuestion(_ position: Int) -> String {
        return quiz[position].question
    }
    
    func getProgree() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            questionNumber = 0
            correctAnsweres = 0
        }
    }
    
    func getScore() -> Int {
        return correctAnsweres
    }
    
    func getOptions(_ positionArray: Int) -> [String] {
        return quiz[positionArray].answers
    }
    
}
