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
    
    static let shareInstance = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func saveFilm(data: Data, title: String) {
        let filme = Filme(context: context)
        filme.imagem = data
        filme.titulo = title
        let listaDeFilmes = DataBaseHelper.shareInstance.fetchImage()
        if !listaDeFilmes.contains(where: {$0.titulo == filme.titulo}) {
            do {
                try context.save()
                print("Image is saved")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchImage() -> [Filme] {
        var fetchingImage = [Filme]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Filme")
        do {
            fetchingImage = try context.fetch(fetchRequest) as! [Filme]
        } catch {
            print("Error while fetching the image")
        }
        return fetchingImage
    }
}
