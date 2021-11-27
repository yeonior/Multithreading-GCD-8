//
//  MyTableViewCell.swift
//  Multithreading-GCD8
//
//  Created by ruslan on 27.11.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    var imageURL: URL? {
        didSet {
            myImageView.image = nil
            setUpImage()
        }
    }
    
    private func setUpImage() {
        if let imageURL = imageURL {
            myActivityIndicatorView.startAnimating()
            DispatchQueue.global(qos: .utility).async {
                if let data = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        // an additional condition for correct image setting up
                        if imageURL == self.imageURL {
                            self.myImageView.image = UIImage(data: data)
                            self.myActivityIndicatorView.stopAnimating()
                        }
                    }
                }
            }
        }
    }
}
