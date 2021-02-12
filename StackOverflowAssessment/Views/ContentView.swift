//
//  ContentView.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var questionsList = QuestionsState()
    
    var body: some View {
        
        VStack {
            if questionsList.isLoading {
                Text("Loading...")
                    .font(Font.avenirNextBold(size: 20))
                    .foregroundColor(Color.customBlack)
            } else {
                if questionsList.error == nil {
                    if self.questionsList.questions != nil {
                        List(self.questionsList.questions!, id: \.id) { question in
                            QuestionView(question: question)
                        }
                    } else {
                        Text("No questions to display")
                            .foregroundColor(Color.customBlack)
                            .fontWeight(.bold)
                    }
                } else {
                    Text("\(questionsList.error!.localizedDescription)")
                        .foregroundColor(Color.customBlack)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        self.questionsList.getQuestions()
                    }) {
                        Text("Try Again")
                            .padding(10)
                    }
                }
            }
        }
        .onAppear {
            self.questionsList.getQuestions()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
