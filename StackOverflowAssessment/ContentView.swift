//
//  ContentView.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var loading: Bool = false
    @ObservedObject var questionsList = QuestionsState()
    
    var body: some View {
        
        VStack {
            if questionsList.isLoading {
                Text("Loading")
            } else {
                Text("Loaded")
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
