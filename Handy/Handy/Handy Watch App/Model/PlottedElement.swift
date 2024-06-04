//
//  PlottedElement.swift
//  Handy Watch App
//
//  Created by Caio Marques on 29/05/24.
//

import Foundation

/// Um objeto que representa um elemento plotado no gráfico, ele tem dois atributos, uma image e um value
/// - parameters:
///        - image: uma string que é capaz de mostrar uma imagem dos assets
///        - value: o valor numérico que indica quantidade desse elemento que existem 
struct PlottedElement: Hashable {
    var image : String
    var value : Int
}
