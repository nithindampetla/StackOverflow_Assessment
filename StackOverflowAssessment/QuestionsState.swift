//
//  QuestionsState.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import Foundation

class QuestionsState: ObservableObject {
    
    @Published var questions: [Question]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    func getQuestions() {
        self.questions = nil
        self.isLoading = true
        
        ApiManager.shared.getQuestions { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let questionReponse):
                self.questions = questionReponse.questions
                self.isLoading = false
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
