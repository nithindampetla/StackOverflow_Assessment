//
//  QuestionView.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import SwiftUI

struct QuestionView: View {
    
    let question: Question
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(question.name)
                    .font(Font.avenirNextBold(size: 20))
                    .minimumScaleFactor(0.6)
                    .foregroundColor(Color.customBlack)
                
                Spacer()
                
                Image(systemName: "checkmark")
                    .font(Font.avenirNextBold(size: 20))
                    .foregroundColor(Color.customGreen)
                    .padding(.trailing, 5)
            }
            
            Text(question.title)
                .font(.body)
                .padding([.top, .bottom], 1)
            if question.tags != nil {
                HStack {
                ForEach(question.tags!, id: \.self) { tag in
                        Text(tag)
                            .font(.footnote)
                            .padding([.leading, .trailing], 8)
                            .padding([.top, .bottom], 3)
                            .background(Color.customWhite)
                            .foregroundColor(Color.customBlack)
                            .minimumScaleFactor(0.6)
                            .frame(height: 20)
                    }
                }
            }

            HStack() {
                
                HStack {
                    Text("Asked:")
                        .font(Font.avenirMedium(size: 11))
                        .foregroundColor(Color.customBlack)
                    
                    Text(question.dateText)
                        .font(Font.avenirNextBold(size: 13))
                        .foregroundColor(Color.customBlack)
                }
                
                Spacer()
                
                HStack {
                    Text("Answers:")
                        .font(Font.avenirMedium(size: 11))
                        .foregroundColor(Color.customBlack)
                        .minimumScaleFactor(0.6)
                    
                    Text("\(question.answerCount)")
                        .font(Font.avenirNextBold(size: 13))
                        .foregroundColor(Color.customBlack)
                }
            }
            .padding(.top, 5)
            
        }
        .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question(id: 1, title: "", answerCount: 1, acceptedId: 0, creationDate: 1.0, tags: nil, owner: nil))
    }
}
