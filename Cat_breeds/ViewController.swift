//
//  ViewController.swift
//  Cat_breeds
//
//  Created by Michael Alexander Rodriguez Urbina on 16/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var breed: UILabel!
    
    @IBOutlet weak var origin: UILabel!
    
    @IBOutlet weak var Intelligence: UILabel!
    
    @IBOutlet weak var catImage: UIImageView!
    
    private let viewModel = ViewModelCat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.breedName.bind { [weak self] breedName in
            self?.breed.text = breedName
        }
        
        viewModel.origin.bind { [weak self] origin in
            self?.origin.text = origin
        }
        
        viewModel.image.bind { [weak self] image in
            self?.catImage.image = image
        }
        
        
    }


}

