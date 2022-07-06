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
    
    func consultaFilmes() {
        listaDeImagens.removeAll()
        servico.request {resultado in
            self.listaDeFilmes = resultado
            
            for i in self.listaDeFilmes {
                
                self.retornaImagem(path: i.posterPath)
                
            }
            
            self.delegate?.atualizaFilmes()
            
        }
    }
    
    func retornaImagem(path: String) {
        guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w300\(path)") else { return }
        guard let data = try? Data(contentsOf: urlImage) else { return }
        let imagem = UIImage(data: data)!
        
            self.listaDeImagens.append(imagem)
        
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
        for filme in filtered {
            retornaImagem(path: filme.posterPath)
        }
        
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
