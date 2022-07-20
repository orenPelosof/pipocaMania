//
//  Filme+CoreDataProperties.swift
//  PipocaMania
//
//  Created by Ana Luiza on 7/11/22.
//

import Foundation
import CoreData


extension Filme {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Filme> {
       
        let request = NSFetchRequest<Filme>(entityName:"Filme")
        request.sortDescriptors = []
        return request
        
    }

    @NSManaged public var titulo: String
    @NSManaged public var imagem: String
    @NSManaged public var descricao: String

}

extension Filme : Identifiable {

}
