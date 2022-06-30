//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Angel Terziev on 12.06.22.
//

import SwiftUI

struct ContentView: View {

    struct Answer {
        var correct:Int
        var your:Int
    }

    struct Score {
        var currentQuestion: Int = 1
        var score: Int = 0
        var maxQuestions: Int = 8
    }
    
    @State private var showingScore = false
    @State private var showingResult = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Bulgaria", "Serbia", "Macedonia", "Greece", "Romania", "Albania", "Montenegro", "Slovenia"].shuffled()
    
    @State private var answer = Answer(correct: Int.random(in: 0...2), your: 0)
    @State private var score = Score()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30.0) {
                Text("Question \(score.currentQuestion) / \(score.maxQuestions)")
                    .foregroundColor(.white)
                    .font(.headline.weight(.heavy))
                    .foregroundStyle(.secondary)

                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    Text(countries[answer.correct])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.secondary)
                }
             
                ForEach(0..<3) { number in
                    Button {
                        // flag was tapped
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                
                Text("Score: \(score.score)")
                    .foregroundColor(.white)
                    .font(.headline.weight(.heavy))
                    .foregroundStyle(.secondary)
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                prepareNextQuestion()
            }
        } message: {
            Text("That's the flag of \(countries[answer.your])")
        }
        .alert("Score", isPresented: $showingResult) {
            Button("Continue") {
                reset()
                askQuestion()
            }
        } message: {
            Text("Your score is: \(score.score) out of \(score.maxQuestions)")
        }
    }
    
    func flagTapped(_ number: Int) {
        answer.your = number
        
        if answer.your == answer.correct {
            scoreTitle = "Correct"
            score.score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    func prepareNextQuestion() {
        if score.currentQuestion == score.maxQuestions {
            showingResult = true
        } else {
            score.currentQuestion += 1
            askQuestion()
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        answer.correct = Int.random(in: 0...2)
    }
    
    func reset() {
        score.score = 0
        score.currentQuestion = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

