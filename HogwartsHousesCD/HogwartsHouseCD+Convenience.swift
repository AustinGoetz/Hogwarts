//
//  HogwartsHouseCD+Convenience.swift
//  HogwartsHousesCD
//
//  Created by Austin Goetz on 7/30/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

extension HouseGuess {
    convenience init(guessName: String, house: String, isVisible: Bool = false, context: NSManagedObjectContext) {
        self.init(context: context)
        self.guessName = guessName
        self.house = house
        self.isVisible = isVisible
    }
}
