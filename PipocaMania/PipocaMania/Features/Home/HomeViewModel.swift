//
//  HomeViewModel.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/20/22.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate {
    func atualizaFilmes()
    func finishedFiltering()
    func searchIsEmpty()
}

class HomeViewModel {
    
    var delegate: HomeViewModelDelegate?
    let servico = ServicoHome()
    
    var listaDeFilmes: [Movie] = []
    var listaDePesquisa: [Movie] = []
    var favorites : [Filme] = []
    var coreData = DataBaseHelper()
    
    var isSearching = false
    
    var paginaAtual = 1
    
    func consultaFilmes() {
        servico.request(numeroDaPagina: paginaAtual) {resultado in
            self.listaDeFilmes.append(contentsOf: resultado)
            self.listaDePesquisa.append(contentsOf: resultado)
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
        
        listaDePesquisa = filtered
        delegate?.finishedFiltering()
    }
    
    func buttonHeartTappedAt(movieIndex: Int){
       let toFavorite = listaDeFilmes[movieIndex]
        if checkFavorite(movieName: toFavorite.originalTitle){
          let favMovie = favorites.filter { item in item.titulo.contains(toFavorite.originalTitle) }
            deleteFavorite(movie: favMovie[0])
            fetchCoreData()
    
        } else {
            saveFavorite(movie: toFavorite)
            fetchCoreData()
        }
    }
    

    func checkFavorite(movieName: String) -> Bool{return favorites.contains(where: {$0.titulo == movieName})}
    
    func deleteFavorite(movie: Filme) { coreData.delete(movie: movie) }
    
    func saveFavorite(movie: Movie){
        
        let convertDate = movie.releaseDate
        let year = String(convertDate.prefix(4))
        let favoriteMovie: MovieToCoreData = MovieToCoreData(
            
            titulo: movie.originalTitle,
            imagem: movie.posterPath,
            descricao: movie.overview)
        
        coreData.save(movie: favoriteMovie)
    }
    
    func fetchCoreData(){
        coreData.requestFavorites { (favoritesMoviesCoreData:Result<[Filme], Error>) in
            switch favoritesMoviesCoreData {
            case.success(let favoritesMoviesCoreData):
                self.favorites = favoritesMoviesCoreData
            case.failure(let error):
                print(error)
            }
        }
    }

}
