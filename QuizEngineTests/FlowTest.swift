//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Praveen on 07/03/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import Foundation
import XCTest

class FlowTest: XCTestCase {
    
    func test_start_withNoQuestions_() {
        let router = Router()
        let sut = Flow(router: router)
        
        sut.start()
        XCTAssertEqual(router.routedQuestionCount, 0)
    }
    
}
