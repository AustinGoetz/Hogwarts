//
//  CoreDataStack.swift
//  HogwartsHousesCD
//
//  Created by Austin Goetz on 7/30/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "HogwartsHousesCD")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext }
}
