//
//  ExerciseDetailView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

/// Essa é uma View que detalha um treino de um dia específico, ela mostra as informações do exercício passado como argumento e permite que se faça o compartilhamento das informações do exercício.
struct ExerciseDetailView: View {
    @State var exercise : Exercise
    @StateObject var vm = ExerciseDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                dateLabel
                    .padding(.bottom)
                
                // mostrando a duração do exercício
                sectionBuilder(title: "Duração", subtitle: exercise.time?.getTimeString() ?? "")
                
                // mostrando o batimento cardíaco médio que ele teve durante o exercício.
                if let avarageHeartBeats = exercise.avarageHeartBeats {
                    sectionBuilder(title: "Batimentos", subtitle: "\(Int(avarageHeartBeats - avarageHeartBeats.truncatingRemainder(dividingBy: 1))) bpm")

                }
                
                // mostrando a intensidade do exercício com base na escala de Borg
                sectionBuilder(title: "Como foi", image: exercise.returnImageBorgScale())
                
                // mostrando o nível de dor que a pessoa sentiu durante os exercícios
                let imagePainLevel = exercise.returnImagePainLevel()
                if !imagePainLevel.isEmpty {
                    sectionBuilder(title: "Intensidade", image: exercise.returnImagePainLevel())
                }
                
                
                // mostrando o botão que permite o compartilhamento das informações exercício
                HStack {
                    Spacer()
                    sharelink
                    Spacer()
                }
                .padding(.top, 30)
            }
        }
        .navigationTitle(exercise.startTrainning.formatted(date: .numeric, time: .omitted))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            // passando o exercício como argumento para a ViewModel usar nas suas funções
            vm.config(exercise: exercise)
        }
        .padding(.horizontal, 5)
        .background(Color.base)
    }
    
    // MARK: COMPONENTES DE UI
    
    var sharelink : some View {
        
        ZStack {
            Color.brand
                .clipShape(Capsule())
                .frame(width: 100)
            
            ShareLink(item: vm.makeSharedText(), preview: SharePreview("Treino do dia: \(exercise.startTrainning.formatted(date: .numeric, time: .omitted).description)")) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .foregroundStyle(.base)
            }
            .tint(.brand)
            .frame(width: 75)
            
        }
        
        
    }
    
    var dateLabel : some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.brand.opacity(0.5))
                .overlay (alignment: .leading) {
                    Text(exercise.endTrainning.formatted(date: .omitted, time: .shortened))
                        .font(.callout)
                        .foregroundStyle(.white)
                        .padding(.leading)
                }
                .frame(height: 35)
            Rectangle()
                .foregroundStyle(.clear)
        }
    }
    
    
    // MARK: VIEW BUILDERS
    
    /// Função que constrói uma seção do detalhamento usando um título e um subtítulo, ele estiliza esses valores e mostra eles de maneira modular.
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
    
    /// Função que constrói uma seção do detalhamento usando um título e uma imagem, ele estiliza esses valores e mostra eles de maneira modular.
    /// - Parameters:
    ///  - title: uma String que representa o título da seção
    ///  - image: uma String que representa o nome da imagem que vai ser mostrada na seção
    /// - Returns: Uma view que representa uma seção
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
        exercise.borgScale = 0
        exercise.time = "20:30s"
        exercise.avarageHeartBeats = 90
        exercise.startTrainning = Date()
        exercise.painLevel = 1
        exercise.exerciseFeedback = 2
        
        return exercise
    }
}
