//
//  PacotesViagensViewController.swift
//  Bus Viagens
//
//  Created by Hellen Caroline on 06/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacote: UILabel!
    
    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listasViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        listasViagens = listaComTodasViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacote.text = self.atualizarContadorLabel()
    }
    
    //protocolos obrigatorios da UICollection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listasViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacotesViagemCollectionViewCell
        
        let pacoteAtual = listasViagens[indexPath.item]
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        
        return celulaPacote
    }
    
    //altera o tamanho da collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let larguraCelula = collectionView.bounds.width / 2
//        return CGSize(width: larguraCelula-15, height: 160)
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/2-20, height: 250)
    }
    
    //metodo selecionar algo pelo usuário
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listasViagens[indexPath.item] //pega o pacote selecionado
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //seleciona o storyboard
      
        //pega a controller certa
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote //passo o pacote selecionado para a controller q vai ser apresentada na tela
      //  present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listasViagens = listaComTodasViagens
        //condicao para ve se tem algo digitado, se tiver procura se nao tiver carrega td
        if searchText != "" {
            listasViagens = listasViagens.filter { $0.viagem.titulo.contains(searchText) }
        }
        self.labelContadorPacote.text = self.atualizarContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizarContadorLabel() -> String {
        return listasViagens.count == 1 ? "1 pacote encontrado" : "\(listasViagens.count) pacotes encontrados"
    }


}
