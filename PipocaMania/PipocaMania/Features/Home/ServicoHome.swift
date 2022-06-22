//
//  ServicoHome.swift
//  PipocaMania
//
//  Created by Ana Luiza on 6/20/22.
//

import Foundation
import UIKit

class ServicoHome {
    
    func request(completion: @escaping ([Result]) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=014aa09f21b98110eba6145cab75df78") else { return }
                
                let session = URLSession.shared
                let task = session.dataTask(with: url) { data, response, error in
                    
                    guard let data = data else { return }
                    let result = try? JSONDecoder().decode(FilmeModel.self, from: data)
                    
                    guard let resultado = result else { return }
                    
                    completion(resultado.results)
                   
                }
                
                task.resume()
        
    }
    func requestImage(linkDaImagem: String, completion: @escaping (UIImage) -> Void) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(linkDaImagem)") else { return }
                
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    completion(UIImage(data: data)!)
                }
            }
            
            task.resume()
        }
        
}
