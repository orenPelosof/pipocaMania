//
//  CategoryViewModel.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/5/22.
//

import Foundation
import UIKit

protocol CategoryViewModelDelegate {
    func atualizaFilmes()
    func finishedFiltering()
    func searchIsEmpty()
    func atualizaCategorias()
}

class CategoryViewModel {
    
    var delegate: CategoryViewModelDelegate?
    let servico = FilterService()
    
    var listaDeFilmes: [Movie] = []
    var listaDeImagens: [UIImage] = []
    var listaDeCategorias: [Genres] = []
    
    var lastGenreSelected: Int?
    
    func consultaFilmes(genreSearched: Int) {
        listaDeImagens.removeAll()
        servico.request(genreNumber: genreSearched) {resultado in
            self.listaDeFilmes = resultado
            
            self.delegate?.atualizaFilmes()
            
        }
    }

    func retornaQuantidadeFilmes() -> Int {
        return listaDeFilmes.count
    }
    
    func realizaPesquisa(from movies: [Movie], searchText: String) {
        let filtered = movies.filter { item in item.originalTitle.lowercased().contains(searchText.lowercased()) }
        
        if filtered.isEmpty {
            delegate?.searchIsEmpty()
            return
        }
        
        listaDeImagens.removeAll()
        
        listaDeFilmes = filtered
        delegate?.finishedFiltering()
    }
    
    func consultaCategoria() {
        servico.requestCategories { completion in
            self.listaDeCategorias = completion
            
            self.delegate?.atualizaCategorias()
        }
    }

}
