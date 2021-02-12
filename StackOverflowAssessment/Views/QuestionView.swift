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
                    .font(Font.custom("AvenirNext-Bold", size: 20))
                    .minimumScaleFactor(0.6)
                    .foregroundColor(Color(#colorLiteral(red: 0.06151095394, green: 0.1732000512, blue: 0.2506391181, alpha: 1)))
                
                Spacer()
                
                Image(systemName: "checkmark")
                    .font(Font.custom("AvenirNext-Bold", size: 20))
                    .foregroundColor(Color(#colorLiteral(red: 0.07058823529, green: 0.5019607843, blue: 0.1254901961, alpha: 1)))
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
                            .background(Color(#colorLiteral(red: 0.7840602176, green: 0.9202123092, blue: 0.9827222842, alpha: 1)))
                            .foregroundColor(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                            .minimumScaleFactor(0.6)
                            .frame(height: 20)
                    }
                }
            }

            HStack() {
                
                HStack {
                    Text("Asked:")
                        .font(Font.custom("Avenir-Medium", size: 11))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    
                    Text(question.dateText)
                        .font(Font.custom("AvenirNext-Bold", size: 13))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    
                    
                }
                
                Spacer()
                
                HStack {
                    Text("Answers:")
                        .font(Font.custom("Avenir-Medium", size: 11))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .minimumScaleFactor(0.6)
                    
                    Text("\(question.answerCount)")
                        .font(Font.custom("AvenirNext-Bold", size: 13))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
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
