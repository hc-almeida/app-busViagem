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

}
