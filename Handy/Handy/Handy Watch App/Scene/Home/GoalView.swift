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
                title
                    .padding(5)
                
                goalGraph

                Spacer()
            }.ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        pencilButton
                        
                    }
                    
                }
            }
        }
        .onAppear(perform: {
            configTreatmentDate()
        })
    }
    
    var title : some View {
        HStack {
            Text("Minha meta")
                .padding()
                .font(.title3)
                .bold()
            
            Spacer()
        }
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
                .padding()
            HStack {
                Image(systemName: "face.smiling.inverse")
                    .foregroundStyle(.borgScale0)
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
            let lineWidth : CGFloat = 20
            
            Circle()
                .stroke(
                    Color.brand.opacity(0.2),
                    lineWidth: lineWidth
                )
                .frame(width: self.getWatchWidth() / 1.4)
            Circle()
                .trim(from: 0, to: calculateProgressTreatment()/100)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                        
                )
                .rotationEffect(.degrees(-90))
                .frame(width: self.getWatchWidth() / 1.4)
                .foregroundStyle(Color.brand)
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
                Image(systemName: "pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .font(.title2)
                    .onTapGesture {}
                    .foregroundStyle(Color.base)
                    .padding()
                    .background(
                        Color.brand
                            .clipShape(Circle())
                    )
                    
            }
        }
    }
}

#Preview {
    NavigationStack {
        GoalView(goal: Goal(name: "", emoji: "🍴", progress: 50))
    }
}

