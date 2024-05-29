//
//  GoalView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct GoalView: View {
    @AppStorage("emoji") var emoji : String = "🍴"
    @AppStorage("dateBeginningTreatment") var beginningTreatmentAppStorage : String = "25_05_2024"
    @AppStorage("dateEndTreatment") var endTreatmentAppStorage : String = "31_05_2024"
    
    @State var initialTreatmentDate : Date?
    @State var endingTreatmentDate : Date?
    
    var goal: Goal
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Minha meta")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 20)
                        .font(.title3)
                    
                    Spacer()
                }
                goalGraph
                    .padding(.bottom, 30)
                Spacer()
            }.ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Spacer()
                    pencilButton
                }
            }
        }
        .onAppear(perform: {
            configTreatmentDate()
        })
    }
    
    
    func getWatchWidth () -> Double {
        let s = WKInterfaceDevice.current().screenBounds
        return s.width
    }
    
    private func configTreatmentDate () {
        initialTreatmentDate = Date.convertStringToDate(beginningTreatmentAppStorage)
        endingTreatmentDate = Date.convertStringToDate(endTreatmentAppStorage)
    }
    
    private func calculateProgressTreatment () -> Double {
        if let initialTreatmentDate, let endingTreatmentDate {
            //primeiramente eu preciso saber a subtração entre a data final pela inicial
            let totalTime = endingTreatmentDate.timeIntervalSinceReferenceDate - initialTreatmentDate.timeIntervalSinceReferenceDate
            let alreadyProgressed = Date().timeIntervalSinceReferenceDate - initialTreatmentDate.timeIntervalSinceReferenceDate
            print(totalTime)
            print(alreadyProgressed)
            return (alreadyProgressed / totalTime) * 100
        }
        
        
        return 0
    }
}



// MARK: GoalProgress
// mostra a progresso do tratamento da pessoa em percentual e emoji
extension GoalView {
    var goalProgress: some View {
        VStack {
            Text(self.emoji)
                .font(.largeTitle)
                .frame(width: 40, height: 60)
            HStack {
                Image(systemName: "face.smiling.inverse")
                Text("\(Int(calculateProgressTreatment()))%")
            }
        }
    }
}


// MARK: GoalGraph
// mostra o gráfico do progresso
extension GoalView {
    var goalGraph: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.white.opacity(0.2),
                    lineWidth: 10
                )
                .frame(width: self.getWatchWidth() / 1.4)
            Circle()
                .trim(from: 0, to: calculateProgressTreatment()/100)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round)
                        
                )
                .rotationEffect(.degrees(-90))
                .frame(width: self.getWatchWidth() / 1.4)
        }
        .overlay(alignment: .center) {
            goalProgress
        }
    }
}

// MARK: PENCIL BUTTON
extension GoalView {
    var pencilButton : some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "pencil.circle.fill")
                    .font(.title2)
                    .onTapGesture {}
            }
        }
    }
}

#Preview {
    NavigationStack {
        GoalView(goal: Goal(name: "", emoji: "🍴", progress: 50))
    }
}
