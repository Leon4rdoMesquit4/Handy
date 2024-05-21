//
//  ExerciseDetailView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    var exercise : Exercise
    @StateObject var vm = ExerciseDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                sectionBuilder(title: "Duração", subtitle: exercise.time ?? "")
                if let avarageHeartBeats = exercise.avarageHeartBeats {
                    sectionBuilder(title: "Batimentos", subtitle: "\(avarageHeartBeats) bpm")
                }
                
                sectionBuilder(title: "Intensidade", image: exercise.returnImageBorgScale())
                
                sectionBuilder(title: "Nível de dor", subtitle: "1")
                
                HStack {
                    Spacer()
                    sharelinkBuilder()
                    Spacer()
                }
            }
        }
        .navigationTitle(exercise.startTrainning?.formatted(date: .numeric, time: .omitted) ?? "")
        .onAppear(perform: {
            vm.config(exercise: exercise)
        })
    }
    
    @ViewBuilder
    func sharelinkBuilder () -> some View {
        ShareLink(item: vm.makeSharedText(), preview: SharePreview("Treino do dia: \(exercise.startTrainning?.formatted(date: .numeric, time: .omitted).description ?? "")")) {
            Image(systemName: "square.and.arrow.up")
        }
        .frame(width: 75)
    }
    
    @ViewBuilder
    func sectionBuilder (title : String, subtitle : String?) -> some View{
        Section {
            Text(title)
                .font(.callout)
            if let subtitle {
                Text(subtitle)
                    .bold()
                    .font(.title3)
            }
            Divider()
        }
    }
    
    @ViewBuilder
    func sectionBuilder (title : String, image : String?) -> some View{
        Section {
            Text(title)
                .font(.callout)
            if let image {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
            }
            Divider()
        }
    }
}

#Preview {
    return NavigationStack {
        ExerciseDetailView(exercise: setupExercise())
    }
    
    func setupExercise () -> Exercise {
        let exercise = Exercise()
        exercise.borgScale = 1
        exercise.time = "20:30s"
        exercise.avarageHeartBeats = 90
        exercise.startTrainning = Date()
        exercise.painLevel = 1
        
        
        return exercise
    }
}
