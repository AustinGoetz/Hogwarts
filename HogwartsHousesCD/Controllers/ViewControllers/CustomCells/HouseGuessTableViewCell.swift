//
//  HouseGuessTableViewCell.swift
//  HogwartsHousesCD
//
//  Created by Austin Goetz on 7/30/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import UIKit

class HouseGuessTableViewCell: UITableViewCell {
    
    var guess: HouseGuess? {
        didSet {
            updateViews()
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var personGuessLabel: UILabel!
    @IBOutlet weak var houseImageButton: UIButton!
    
    // MARK: - Actions
    @IBAction func houseButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Helpers
    func updateViews() {
        guard let guess = guess else { return }
        
        personGuessLabel.text = guess.guessName
    }
}
