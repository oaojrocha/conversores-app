//
//  ViewController.swift
//  Conversores
//
//  Created by Joao Rocha on 01/05/18.
//  Copyright © 2018 Joao Rocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnit1.setTitle("Kilôgrama", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilômetro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnit1.setTitle("Celcius", for: .normal)
            btUnit2.setTitle("Farenheit", for: .normal)
        }
        Convert(nil)
    }
    
    @IBAction func Convert(_ sender: UIButton?) {
        lbResultUnit.isHidden = false
        lbResult.isHidden = false
        
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1
        }
        
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true);
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result) 
    }
    
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Farenheit"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else {
            lbResultUnit.text = "Celcius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight  / 2.2046)
        } else {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight  * 2.2046)
        }
    }
    
    func calCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 3.5)
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
        
    }
    
    func calcDistance() {
        guard let distance  = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1 {
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(distance * 1000.0)
        } else {
            lbResultUnit.text = "Metro"
            lbResult.text = String(distance / 1000.0)
        }
    }
    
}

