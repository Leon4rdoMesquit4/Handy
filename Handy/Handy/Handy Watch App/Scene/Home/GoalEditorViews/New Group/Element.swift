//
//  Element.swift
//  Handy Watch App
//
//  Created by Caio Marques on 05/06/24.
//

import Foundation
import SwiftUI

/// View que renderiza um elemento com as datas do tratamento (é usada na GoalDateEditorView para renderizar a data de início e fim de tratamento)
/// - Parameters:
///     - title: String do título do Card
///     - date: data que vai ser mostrada no card
///     - completion: código que vai ser executado se o usuário apertar no card.
struct DateCard : View {
    var title : String
    var date: Date
    var completion : () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(.brand.opacity(0.5))
            .overlay (alignment: .topLeading){
                
                VStack (alignment: .leading){
                    Text(title)
                        .font(.caption2)
                        .bold()
                    Text(dateLabel(date))
                        .font(.caption2)
                        .foregroundStyle(.brandColor2)
                }
                .padding(3)
                .padding(.horizontal)
            }
            .onTapGesture {
                completion()
            }
    }
    
    /// Uma função que recebe uma Data opcional e se ela existir retorna ela formatada de forma numérica e se não existir, ela retorna um placeholder.
    func dateLabel (_ date : Date?) -> String {
        if let date {
            return date.formatted(date: .numeric, time: .omitted)
        } else {
            return "dd/mm/aaaa"
        }
    }
}
