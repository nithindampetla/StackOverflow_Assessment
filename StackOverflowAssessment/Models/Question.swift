//
//  Question.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import Foundation

struct Question: Codable {
    let id: Int
    let title: String
    let answerCount: Int
    let acceptedId: Int?
    let creationDate: Double
    let tags: [String]?
    let owner: Owner?
    
    var dateText: String {
        let date = Date(timeIntervalSince1970: creationDate)
        return Utils.dateFormatterPrint.string(from: date)
    }
    
    var name: String {
        guard let owner = self.owner else {
            return "No username"
        }
        return owner.name
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "question_id"
        case title = "title"
        case answerCount = "answer_count"
        case acceptedId = "accepted_answer_id"
        case creationDate = "creation_date"
        case tags = "tags"
        case owner = "owner"
    }
}

class Utils {
    static let dateFormatterPrint: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter
    }()
}

struct Owner: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case name = "display_name"
    }
}

