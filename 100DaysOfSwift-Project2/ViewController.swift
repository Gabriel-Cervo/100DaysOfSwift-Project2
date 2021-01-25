//
//  ViewController.swift
//  100DaysOfSwift-Project2
//
//  Created by João Gabriel Dourado Cervo on 25/01/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
        // layer = CALayer... Modificar views
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // CALayer nao reconhece UIColor, entao é necessário chamar especificamente, e tambem é necessário passar um cgColor (CALayer nao reconhece UIColor...), chamamos então essa propriedade do UIColor
        // Criar proprias cores:
        // UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0)
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion() {
        // Seta imagem para os botoes
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }


}

