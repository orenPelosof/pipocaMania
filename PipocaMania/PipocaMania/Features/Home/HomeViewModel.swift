//
//  HomeViewModel.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/20/22.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate {
    
    func atualizaListaDeFilmes(listaDeFilmes:[Result])
    func atualizaImagens(listaDeImagens:[UIImage])
    
}

class HomeViewModel {
    
    var delegate: HomeViewModelDelegate?
    let servico = ServicoHome()
    
    var listaDeFilmes: [Result] = []
    var listaDeImagens: [UIImage] = []
    
    func consultaFilmes() {
        servico.request {resultado in
            print(resultado)
            self.delegate?.atualizaListaDeFilmes(listaDeFilmes: resultado)
            
        }
    }
    func retornaImagem(listaDeFilmes: [Result]) {
        for filme in listaDeFilmes {
            servico.requestImage(linkDaImagem: filme.posterPath) { imagem in
                self.listaDeImagens.append(imagem)
                self.delegate?.atualizaImagens(listaDeImagens:self.listaDeImagens)
            }
        }
    }
}
