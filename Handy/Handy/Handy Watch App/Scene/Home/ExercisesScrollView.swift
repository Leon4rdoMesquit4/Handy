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
                        .font(.alata(.regular, size: 18, relativeTo: .title3))
                        .foregroundStyle(.baseColor2)
                    Spacer()
                }
                Spacer()
            }.ignoresSafeArea()
            ScrollView {
                ForEach(exercises) { exercise in
                    exerciseListItem(exercise: exercise)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                }
                
            }.padding(.top, 18)
        }.background(Color.base)
    }
}

extension ExercisesScrollView {
    @ViewBuilder
    func exerciseListItem(exercise: Exercise) -> some View {
        VStack (alignment: .leading) {
            HStack {
                Text(exercise.startTrainning.formatted(date: .numeric, time: .omitted))
                    .font(.alata(.regular,size: 15, relativeTo: .body))
                    .foregroundStyle(Color.baseColor2)
                    
                Spacer()
                Image(systemName: "control")
                    .rotationEffect(.degrees(90))
            }
            .padding(.horizontal)
            .padding(.vertical, 17)
            .background{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color.brandColor1.opacity(0.5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.brandColor1, lineWidth: 1)
                            .foregroundStyle(Color.brandColor1.opacity(0.5))
                    }
            }
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
