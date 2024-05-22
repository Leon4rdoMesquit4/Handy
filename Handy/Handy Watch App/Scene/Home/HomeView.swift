//
//  HomeView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("Fennec")
                .resizable()
                .frame(width: 200, height: 230)
            VStack {
                HStack {
                    Image(systemName: "chart.bar.xaxis")
                        .padding(12)
                        .onTapGesture {
                            print("hey")
                        }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image("addExercise")
                        .padding(.trailing, 10)
                        .onTapGesture {
                            print("hey")
                        }
                }
                Spacer()
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
