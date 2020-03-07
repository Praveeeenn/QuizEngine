//
//  Flow.swift
//  QuizEngine
//
//  Created by Praveen on 07/03/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import Foundation

protocol Router {
    func routeTo(question: String)
}

class Flow {
    let router: Router
    let questions: [String]
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        if !questions.isEmpty {
            router.routeTo(question: "")
        }
    }
}
