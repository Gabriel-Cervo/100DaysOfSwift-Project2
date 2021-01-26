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
    var correctAnswer = 0
    
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
    
    // o action é necessário para poder ser usado como handler no botao
    // default = nil
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle() // Sorteia os paises
        // Existe tambem o metodo .shuffled(), que retorna um array novo
        
        // Seta imagem para os botoes
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2) // Numero aleatorio
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var answerResponse: String
        
        if sender.tag == correctAnswer {
            answerResponse = "Correct"
            score += 1
        } else {
            answerResponse = "Wrong"
            score -= 1
        }
        
        // Cria um alerta
        let alertController = UIAlertController(title: answerResponse, message: "Your score is \(score)", preferredStyle: .alert)
        // O preferredStyle tem duas opcoes, o alert (da um alerta) e o .actionSheet, que desliza as opcoes debaixo
        // Alerta para mostrar quando algo mudar e actionSheet para perguntar um set de opcoes
        
        // adiciona o botao de continuar
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        // Aqui o style tem 3 opcoes, .default, .cancel e .destructive
        
        // Chama o alerta
        present(alertController, animated: true)
    }
    
}

