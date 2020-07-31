//
//  HouseGuessController .swift
//  HogwartsHousesCD
//
//  Created by Austin Goetz on 7/30/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

class HouseGuessController {
    
    // MARK: - Singleton
    static let shared = HouseGuessController()
    
    // MARK: - Class Properties
    let fetchedReusltsController: NSFetchedResultsController<HouseGuess> = {
        
        let fetchRequest: NSFetchRequest<HouseGuess> = HouseGuess.fetchRequest()
        let veiledSort = NSSortDescriptor(key: "isVisible", ascending: false)
        
        fetchRequest.sortDescriptors = [veiledSort]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isVisible", cacheName: nil)
    }()
    
    init() {
        do {
            try fetchedReusltsController.performFetch()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    // MARK: - CRUD
    // Create
    func createGuess(guessName: String, house: String) {
        _ = HouseGuess(guessName: guessName, house: house)
        
        
        saveToPersistentStore()
    }
    
    // Update
    func updateVisibility(houseGuess: HouseGuess) {
        houseGuess.isVisible = !houseGuess.isVisible
        
        saveToPersistentStore()
    }
    
    // Remove
    func remove(houseGuess: HouseGuess) {
        let moc = CoreDataStack.context
        moc.delete(houseGuess)
        
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
