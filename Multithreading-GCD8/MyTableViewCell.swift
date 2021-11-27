//
//  MyTableViewCell.swift
//  Multithreading-GCD8
//
//  Created by ruslan on 27.11.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    var imageURL: URL? {
        didSet {
            myImageView.image = nil
            updateUI()
        }
    }
    
    private func updateUI() {
        
    }
}
