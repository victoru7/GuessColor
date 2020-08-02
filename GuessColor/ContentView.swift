//
//  ContentView.swift
//  GuessColor
//
//  Created by Виктор Устюжанин on 02.08.2020.
//  Copyright © 2020 Виктор Устюжанин. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Double = 50
    @State private var randomNumber: Int = Int.random(in: 0...100)
    @State private var showAlert: Bool = false

    var color: UIColor = .blue
       
    var body: some View {
        VStack{
            Text("Подвинь слайдер, как можно ближе к: \(randomNumber)")
            HStack {
                Text("0")
                ColorUISlider(value: $sliderValue, color: color)
                    .accentColor(Color(color)).opacity(Double(computeScore())/100)
                Text("100")
                
            }
            
            Button(action: {self.showAlert.toggle()}) {
                Text("Проверь меня")
                    .padding()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Your score"),
                    message: Text("\(computeScore())"),
                    dismissButton: .default(Text("OK")) )
                
            }
            
            Button(action: {self.randomNumber = Int.random(in: 0...100)}) {
                Text("Начать заново")
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(randomNumber - lround(sliderValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
