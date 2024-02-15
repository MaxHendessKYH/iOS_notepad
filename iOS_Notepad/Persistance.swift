//
//  Persistance.swift
//  CoreDataDB
//
//  Created by Max.Hendess on 2024-02-12.
//

import Foundation
import CoreData

struct Pesrsistance{
    
    static let shared = Pesrsistance()
    
    let container: NSPersistentContainer
    init(){
        //db reference setup
        container = NSPersistentContainer(name: "NoteModel")
        
        container.loadPersistentStores{(description, error) in
            
            if let error = error {
                print("Error loading core data: \(error)")
            }else{
                print("Success")
            }
        }
    }
}
