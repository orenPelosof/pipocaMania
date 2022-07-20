//
//  ServicoHome.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/20/22.
//

import Foundation

class ServicoHome {
    
    func request(numeroDaPagina: Int, completion: @escaping ([Movie]) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=fac7bcf7b467651b16fb9d8b092c85ea&language=en-US&page=\(numeroDaPagina)") else { return }
                
                let session = URLSession.shared
                let task = session.dataTask(with: url, completionHandler: { data, response, error in
                    DispatchQueue.main.async {
                    guard let data = data else { return }
                    let result = try? JSONDecoder().decode(FilmeModel.self, from: data)
                    
                    guard let resultado = result else { return }
                    
                    completion(resultado.results)
                    }
                   
                })
                
                task.resume()
        
    }
        
}
