//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Louis Melone on 1/29/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let Text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        self.Text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
