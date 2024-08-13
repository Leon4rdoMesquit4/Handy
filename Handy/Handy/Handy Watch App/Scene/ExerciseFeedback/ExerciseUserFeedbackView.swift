//
//  ExerciseDifficultyView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI
import SwiftData
import WatchKit

struct ExerciseUserFeedbackView: View {
    @State var feedback : Int = 0
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    
    var body: some View {
        ZStack{
            VStack {
                TitleForm(text: String(localized:"Como foi a prática do exercício"))
                StepperImage(value: $feedback, interval: 0 ... 5, prefixImage: "intensity")
                    .padding(WKInterfaceDevice.current().screenBounds.height / 400)
                
                Text(labelIntensity())
                    .font(.caption2)
                    .padding(.bottom, WKInterfaceDevice.current().screenBounds.height / 400)
                
                ButtonNextPage{
                    controller.exerciseFeedback = Double(feedback)
                    coordinator.navigate(to: .didFeelPainView)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("1/3")
                }
            }
        }.background(Color.base)
        
    }
    
    /// Uma função que retorna uma string que representa a legenda que vai ser colocada abaixo da imagem
    func labelIntensity () -> String {
        switch feedback {
        case 0: String(localized: "fácil")
            case 1: String(localized: "Ligeiramente fácil")
        	case 2: String(localized: "Desconfortável")
            case 3: String(localized: "Cansativo")
            case 4: String(localized: "Muito cansativo")
            case 5: String(localized: "Exaustivo")
            default: ""
        }
    }
}

#Preview {
    NavigationStack {
        ExerciseUserFeedbackView()
            .environment(Coordinator())
            .environment(SwiftDataController())
    }
}
