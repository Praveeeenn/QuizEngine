//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Praveen on 07/03/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    
    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)
        sut.start()
        XCTAssertEqual(router.routedQuestionCount, 0)
    }
    
    func test_start_withOneQuestion_routeToQuesiton() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        sut.start()
        XCTAssertEqual(router.routedQuestionCount, 1)
    }
    
    func test_start_withOneQuestion_routeToCorrectQuesiton() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        sut.start()
        XCTAssertEqual(router.routedQuestion, "Q1")
    }
 
    class RouterSpy: Router {
        var routedQuestionCount: Int = 0
        var routedQuestion: String? = nil
        func routeTo(question: String) {
            routedQuestionCount += 1
            routedQuestion = question
        }
    }
    
}
