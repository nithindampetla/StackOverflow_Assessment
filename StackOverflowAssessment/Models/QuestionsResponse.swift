//
//  QuestionsResponse.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import Foundation

struct QuestionsResponse: Codable {
    var questions: [Question]
    
    enum CodingKeys: String, CodingKey {
        case questions = "items"
    }
}
