//
//  HeroCell.swift
//  Marvel
//
//  Created by iOSLab on 29/06/24.
//

import UIKit


// Herdando tudo da classe UITableViewCell
class HeroCell: UITableViewCell{
    @IBOutlet weak var nameInput: UILabel!
    @IBOutlet weak var imageInput: UIImageView!
    
    func setup (name: String, image:UIImage){
    nameInput.text = name
    imageInput.image = image
    }
}
