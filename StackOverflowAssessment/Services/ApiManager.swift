//
//  ApiManager.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    
    private let apiKey = "PMB28GEXR8lt5oUVWx)2Xg(("
    private let baseAPIURL = "https://api.stackexchange.com/2.2"
    private let parameters = "order=desc&sort=month&site=stackoverflow"
    
    func getQuestions(completion: @escaping (Result<QuestionsResponse, QuestionError>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)/questions?\(parameters)&key=\(apiKey)") else {
            self.executeCompletionHandler(with: .failure(.invalidEndpoint), completion: completion)
            return
        }
        
        loadURLAndDecode(url: url, completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, completion: @escaping (Result<D, QuestionError>) -> ()) {

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.executeCompletionHandler(with: .failure(.apiError), completion: completion)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandler(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandler(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(D.self, from: data)
                self.executeCompletionHandler(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandler(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    func executeCompletionHandler<D: Decodable>(with result: Result<D, QuestionError>, completion: @escaping (Result<D, QuestionError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}





