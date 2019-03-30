//
//  ViewController.swift
//  IMC
//
//  Created by Brian Diego De Souza on 29/03/19.
//  Copyright © 2019 Array App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivResultado: UIImageView!
    @IBOutlet weak var viResultado: UIView!
    
    var imc: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func Calcular(_ sender: Any) {
        if let peso = Double(tfPeso.text!), let altura = Double(tfAltura.text!){
            imc = peso / pow(altura,2) //Elevado ao quadrado
            mostrarResultado()
        }
    }
    func mostrarResultado(){
        var resultado: String = ""
        var imagem: String = ""
        
        switch imc {
            case 0..<16:
                resultado = "Magreza"
                imagem = "abaixo"
            case 16..<18.5:
                resultado = "Abaixo do peso"
                imagem = "abaixo"
            case 18.5..<25:
                resultado = "Peso ideal"
                imagem = "ideal"
            case 25..<30:
                resultado = "Sobrepeso"
                imagem = "sobre"
            default:
                resultado = "Obesidade"
                imagem = "obesidade"
        }
        lbResultado.text = "\(Int(imc)): \(resultado)"
        ivResultado.image = UIImage(named: imagem)
        viResultado.isHidden = false
        view.endEditing(true) //Teclado desaparece
    }
}

