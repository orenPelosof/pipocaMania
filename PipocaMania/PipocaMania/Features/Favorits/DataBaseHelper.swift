//
//  DataBaseHelper.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/4/22.
//

import Foundation
import UIKit
import CoreData

class DataBaseHelper {

    
    private let controller: NSFetchedResultsController<Filme>
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError()}
        let request = Filme.fetchRequest()
        let managedContext = appDelegate.persistentContainer.viewContext
        controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func requestFavorites(completion: @escaping ((Result<[Filme], Error>) -> Void)) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError()}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Filme")

        controller.managedObjectContext.performAndWait {
   
            do {
                try self.controller.performFetch()
                let savedMovies = try managedContext.fetch(fetchRequest) as? [Filme]
                completion(.success(savedMovies ?? []))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func save(movie: MovieToCoreData) {
        controller.managedObjectContext.performAndWait {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Filme",in: managedContext)!
            let filme = Filme(entity: entity, insertInto: managedContext)
                 
            filme.titulo = movie.titulo
            filme.imagem = movie.imagem
            filme.descricao = movie.descricao
            
            self.controller.managedObjectContext.insert(filme)
            try? self.controller.managedObjectContext.save()
        }
    }
    
    func delete(movie: Filme) {
        
        controller.managedObjectContext.performAndWait {
            self.controller.managedObjectContext.delete(movie)
            try? self.controller.managedObjectContext.save()
        }
    }
    
}



