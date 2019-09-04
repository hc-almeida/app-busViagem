//
//  ViewController.swift
//  Bus Viagens
//
//  Created by Hellen Caroline on 30/08/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    
    @IBOutlet weak var viewHoteis: UIButton!
    
    @IBOutlet weak var viewPacotes: UIButton!
    
    let listasViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewPacotes.layer.cornerRadius = 10 //muda o raio da view, dx arrendondado
        self.viewHoteis.layer.cornerRadius = 10
    }
    
    //inf numero de linhas, pegando como referencia o array.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listasViagens.count
    }
    
    //inf o conteúdo dessas linhas, no caso inf as celulas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
      
        let viagemAtual = listasViagens[indexPath.row]
        
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        cell.labelPreco.text = "R$ \(viagemAtual.preco)"
        cell.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        cell.imagemViagem.layer.cornerRadius = 10
        cell.imagemViagem.layer.masksToBounds = true //mascara de corte com o raio q colocamos
        
        //cell.textLabel?.text = viagemAtual.titulo //mostra os text do array qnd o metodo passar
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //setta o valor da celular conforme o divece que o usuario esta usando
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }


}

