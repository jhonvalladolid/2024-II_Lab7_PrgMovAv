//
//  SecondViewController.swift
//  UsodeControlesValladolid
//
//  Created by Mac05 on 3/10/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    var nro1: Double = 0
    var nro2: Double = 0

    @IBOutlet weak var controlSegmento: UISegmentedControl!
    @IBAction func elegirSegmento(_ sender: Any) {
        if Double(txtNumero1.text!) != nil && Double(txtNumero2.text!) != nil {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            let opcion = controlSegmento.selectedSegmentIndex
            switch opcion {
            case 0:
                lblRespuesta.text = Operacion(n1: nro1, n2: nro2, op: "+")
            case 1:
                lblRespuesta.text = Operacion(n1: nro1, n2: nro2, op: "-")
            case 2:
                lblRespuesta.text = Operacion(n1: nro1, n2: nro2, op: "*")
            case 3:
                if nro2 == 0 {
                    lblRespuesta.text = "Error: División por cero"
                } else {
                    lblRespuesta.text = Operacion(n1: nro1, n2: nro2, op: "/")
                }
            default:
                lblRespuesta.text = "Error"
            }
        } else {
            lblRespuesta.text = "Error"
        }
    }
    @IBOutlet weak var txtNumero1: UITextField!
    @IBOutlet weak var txtNumero2: UITextField!
    @IBOutlet weak var lblRespuesta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        view.addGestureRecognizer(tap)
    }
    
    func Operacion(n1: Double, n2: Double, op: String) -> String {
        switch op {
        case "+":
            return String(n1 + n2)
        case "-":
            return String(n1 - n2)
        case "*":
            return String(n1 * n2)
        case "/":
            return String(n1 / n2)
        default:
            return "Error"
        }
    }

    @objc func ocultarTeclado() {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
