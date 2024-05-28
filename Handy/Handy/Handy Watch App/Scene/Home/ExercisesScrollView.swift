//
//  ExercisesScrollView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI
import SwiftData

struct ExercisesScrollView: View {
    
    @Environment(Coordinator.self) var coordinator
    @Query(sort: \Exercise.startTrainning, order: .reverse) private var exercises: [Exercise]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Suas práticas")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 25)
                        .font(.title3)
                    Spacer()
                }
                Spacer()
            }.ignoresSafeArea()
            ScrollView {
                ForEach(exercises) { exercise in
                    exerciseListItem(exercise: exercise)
                }
                
            }.padding(.top, 25)
        }
    }
}

extension ExercisesScrollView {
    @ViewBuilder
    func exerciseListItem(exercise: Exercise) -> some View {
        VStack (alignment: .leading) {
            HStack {
                Text(exercise.startTrainning.formatted(date: .numeric, time: .omitted))
                    .foregroundStyle(.black)
                    .padding(.leading)
                Spacer()
            }
            .padding(.vertical, 25)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                coordinator.navigate(to: .exerciseDetailView(exercise
                                                            ))
            }
        }
    }
}

#Preview {
    ExercisesScrollView()
        .environment(Coordinator())
}
