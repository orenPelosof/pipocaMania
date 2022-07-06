//
//  FilterService.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/20/22.
//

import Foundation

class FilterService {
    
    func request(completion: @escaping ([Movie]) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=fac7bcf7b467651b16fb9d8b092c85ea&language=en-US&page=1") else { return }
                
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
    
    func requestCategories(completion: @escaping ([Genres]) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=fac7bcf7b467651b16fb9d8b092c85ea&language=en-US&page=1") else { return }
                
                let session = URLSession.shared
                let task = session.dataTask(with: url, completionHandler: { data, response, error in
                    DispatchQueue.main.async {
                    guard let data = data else { return }
                    let result = try? JSONDecoder().decode(CategoryModel.self, from: data)
                    
                    guard let resultado = result else { return }
                    
                        completion(resultado.genres)
                    }
                   
                })
                
                task.resume()
        
    }
}
