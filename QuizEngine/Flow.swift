//
//  Flow.swift
//  QuizEngine
//
//  Created by Praveen on 07/03/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import Foundation

protocol Router {
    func routeTo(question: String, answerCallback: @escaping (String) -> Void)
}

class Flow {
    let router: Router
    let questions: [String]
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        guard let firstQuestion = questions.first else { return }
        router.routeTo(question: firstQuestion) { [weak self] _ in
            guard let strongSelf = self else { return }
            let nextQuestionIndex = strongSelf.questions.firstIndex(of: firstQuestion)!
            let nextQuestion = strongSelf.questions[nextQuestionIndex]
            strongSelf.router.routeTo(question: nextQuestion) { _ in }
        }
    }
}
