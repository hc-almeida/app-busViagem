//
//  Viagem.swift
//  Bus Viagens
//
//  Created by Hellen Caroline on 01/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    init (titulo:String, quantidadeDeDias:Int, preco:String, caminhoDaImagem:String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
