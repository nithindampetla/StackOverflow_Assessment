//
//  Question.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import Foundation

struct Question: Codable {
    let title: String
    let answers: Int
    let acceptedId: Int?
    let creationDate: Double
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case answers = "answer_count"
        case acceptedId = "accepted_answer_id"
        case creationDate = "creation_date"
    }
}

