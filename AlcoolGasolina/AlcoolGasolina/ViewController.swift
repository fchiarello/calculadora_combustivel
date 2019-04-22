//
//  ViewController.swift
//  AlcoolGasolina
//
//  Created by Fellipe Ricciardi Chiarello on 9/26/18.
//  Copyright © 2018 fchiarello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RetornoCalculo: UILabel!
    @IBOutlet weak var CampoPrecoAlcool: UITextField!
    @IBOutlet weak var CampoPrecoGasolina: UITextField!
    
    
    @IBAction func BotaoCalcular(_ sender: Any) {
        
        if let precoAlcool = CampoPrecoAlcool.text {
            if let precoGasolina = CampoPrecoGasolina.text {
                
// Validar VAlores digitados
               let validaCampos = self.validarCampos (precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if validaCampos {
//                Calculo do melhor combustivel
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                }else {
                    RetornoCalculo.text="Preencha todos os campos para calcular!"
                    
                }
            
        }
        }
    }
  
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        if let valorAlcool = Double (precoAlcool){
            if let valorGasolina = Double (precoGasolina){
                /* Divisao Valor Alcool pelo da Gasolina
                    Se resulta >= 0.7 melhor usar gasolina
                    senao, melhor alcool*/
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.RetornoCalculo.text = "Melhor utilizar Gasolina!"
                } else {
                    self.RetornoCalculo.text = "Melhor utilizar Álcool!"
                }
                
                
            }
            
        }
        
    }
    
        func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
            
            
            var camposValidados = true
            
            if precoAlcool.isEmpty{
                camposValidados = false
            } else if precoGasolina.isEmpty {
                camposValidados = false
            }
            
            
            return camposValidados
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

