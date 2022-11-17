//
//  Question.swift
//  quizApp
//
//  Created by Kiran Kishore on 16/07/19.
//  Copyright © 2019 CDNS. All rights reserved.
//

import Foundation


class Question{
    
    let questionText : String
    let answer : Bool
    
    init(text : String , correctAnswer : Bool) {
        
        questionText = text
        answer = correctAnswer
    }
    
}


