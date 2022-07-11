//
//  FilterViewModel.swift
//  PipocaMania
//
//  Created by Oren Pelosof on 08/06/22.
//

import UIKit
import Reusable


class FilterViewModel: UIViewController {

    @IBOutlet var categoriasPickerView: UIPickerView!
    
    let viewModel: CategoryViewModel = CategoryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriasPickerView.setValue(UIColor.white, forKeyPath: "textColor")
        categoriasPickerView.backgroundColor = .primary
        
        categoriasPickerView.delegate = self
        categoriasPickerView.dataSource = self
        
        viewModel.delegate = self
        viewModel.consultaCategoria()
        // Do any additional setup after loading the view.
    }
    

}

extension FilterViewModel: CategoryViewModelDelegate {
    func atualizaFilmes() {
        
    }
    
    func finishedFiltering() {
        
    }
    
    func searchIsEmpty() {
        
    }
    
    func atualizaCategorias() {
        categoriasPickerView.reloadAllComponents()
    }
    
    
}

extension FilterViewModel: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genero = viewModel.listaDeCategorias[row].name
        print(genero)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.listaDeCategorias[row].name
    }
}

extension FilterViewModel: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = "\(viewModel.listaDeCategorias[row].name)"
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

            return myTitle
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.listaDeCategorias.count
    }
    
}
