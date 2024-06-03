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
                // mostrando a duração do exercício
                sectionBuilder(title: "Duração", subtitle: exercise.time?.getTimeString() ?? "")
                
                // mostrando o batimento cardíaco médio que ele teve durante o exercício.
                if let avarageHeartBeats = exercise.avarageHeartBeats {
                    sectionBuilder(title: "Média de batimentos", subtitle: "\(Int(avarageHeartBeats - avarageHeartBeats.truncatingRemainder(dividingBy: 1))) bpm")
                }
                
                // mostrando a intensidade do exercício com base na escala de Borg
                sectionBuilder(title: "Intensidade", image: exercise.returnImageBorgScale())
                
                // mostrando o nível de dor que a pessoa sentiu durante os exercícios
                sectionBuilder(title: "Nível de dor", subtitle: "\(Int(exercise.painLevel ?? 0))")
                
                // mostrando o botão que permite o compartilhamento das informações exercício
                HStack {
                    Spacer()
                    sharelink
                    Spacer()
                }
            }
        }
        .navigationTitle(exercise.startTrainning.formatted(date: .numeric, time: .omitted))
        .onAppear{
            // passando o exercício como argumento para a ViewModel usar nas suas funções
            vm.config(exercise: exercise)
        }
    }
    
    var sharelink : some View {
        ShareLink(item: vm.makeSharedText(), preview: SharePreview("Treino do dia: \(exercise.startTrainning.formatted(date: .numeric, time: .omitted).description)")) {
            Image(systemName: "square.and.arrow.up")
        }
        .frame(width: 75)
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
