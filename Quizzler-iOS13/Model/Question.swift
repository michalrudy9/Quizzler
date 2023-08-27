//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Michał Rudy on 27/08/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.correct = correctAnswer
    }
}
