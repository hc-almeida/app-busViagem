//
//  TableViewCell.swift
//  Bus Viagens
//
//  Created by Hellen Caroline on 03/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    
    @IBOutlet weak var labelPreco: UILabel!
    
    @IBOutlet weak var imagemViagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuraCelula(viagem: Viagem) {
        labelTitulo.text = viagem.titulo
        labelQuantidadeDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.layer.masksToBounds = true //mascara de corte com o raio q colocamos
        
        //cell.textLabel?.text = viagemAtual.titulo //mostra os text do array qnd o metodo passar
        
    }

}
