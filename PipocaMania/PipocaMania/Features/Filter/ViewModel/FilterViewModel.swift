//
//  FilterViewModel.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 08/06/22.
//

import UIKit

protocol FilterViewModelDelegate {
    func nomearCategoriasLabel()
}


class FilterViewModel: UIViewController {

    @IBOutlet var categoriasPickerView: UIPickerView!
    
    let categoriasDisponiveis: [String] = ["Todas", "Ação", "Animação", "Aventura", "Terror", "Romance", "Ficção Científica", "Comédia", "Temas adultos", "Para toda família", "Infantil"]
    
     var delegate: FilterViewModelDelegate? = nil
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriasPickerView.setValue(UIColor.white, forKeyPath: "textColor")
        categoriasPickerView.backgroundColor = .black
        
        categoriasPickerView.delegate = self
        categoriasPickerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

}

extension FilterViewModel: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genero = categoriasDisponiveis[row]
        print(genero)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriasDisponiveis[row]
    }
}

extension FilterViewModel: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            let titleData = "\(categoriasDisponiveis[row])"
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

            return myTitle
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return categoriasDisponiveis.count
    }
    
}
