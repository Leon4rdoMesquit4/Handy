//
//  ExercisesScrollView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExercisesScrollView: View {
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
                exerciseListItem
            }.padding(.top, 25)
        }
    }
}

extension ExercisesScrollView {
    var exerciseListItem: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("10/05/24")
                    .foregroundStyle(.black)
                    .padding(.leading)
                Spacer()
            }
            .padding(.vertical, 25)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    ExercisesScrollView()
}
