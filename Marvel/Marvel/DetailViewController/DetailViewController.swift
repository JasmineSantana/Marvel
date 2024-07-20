//
//  DetailViewController.swift
//  Marvel
//
//  Created by iOSLab on 13/07/24.
//

import UIKit



class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Criamos um guarlet que vai se chamar hero e vamos puxar o delegate e instaciar a FUNC do protocol
        guard let hero = delegate?.getHero() else {
            return
        }
        nameLabel.text = hero.name
        imageView.image = hero.image
        descriptionLabel.text = hero.description
    }
}
