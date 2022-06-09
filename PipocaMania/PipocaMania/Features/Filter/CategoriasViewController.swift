//
//  CategoriasViewController.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 08/06/22.
//

import UIKit

class CategoriasViewController: UIViewController {

    @IBOutlet var categoriasPickerView: UIPickerView!
    
    let categoriasDisponiveis: [String] = ["Ação", "Animação", "Aventura", "Terror", "Romance", "Ficção Científica", "Comédia", "Temas adultos", "Para toda família", "Infantil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriasPickerView.delegate = self
        categoriasPickerView.dataSource = self

        // Do any additional setup after loading the view.
    }

}

extension CategoriasViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genero = categoriasDisponiveis[row]
        print(genero)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriasDisponiveis[row]
    }
}

extension CategoriasViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return categoriasDisponiveis.count
    }
    
}
