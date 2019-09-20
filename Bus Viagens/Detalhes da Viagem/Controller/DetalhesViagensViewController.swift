//
//  DetalhesViagensViewController.swift
//  Bus Viagens
//
//  Created by Hellen Caroline on 12/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    
        var pacoteSelecionado: PacoteViagem? = nil //pega os pacotes de viagem e joga no pacoteSelecionado
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil )
        
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }
    }
    
    @objc func aumentaScroll(notification:Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
       // self.scrollPrincipal.contentOffset.y = 200 faz dar um foco no campo clicado
    }
   
    @objc func exibeDataTextField (sender:UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
       // self.dismiss(animated: true, completion: nil)
        if let navigation = navigationController {
             navigation.popToRootViewController(animated: true)
        }
    }
    
    //pega o momento q clica no camp data e entao mostra a data
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        //coloca a data no text field
        datePickerView.addTarget(self , action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func botaoFinazarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPag") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
      //  self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

