//
//  TrainerCell.swift
//  GymTec
//
//  Created by cdt307 on 3/30/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class TrainerCell: UICollectionViewCell {

    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData(text: String){
        self.textLabel.text = text
    }
    
    func setImage(url: String){
        self.cellImageView.image = UIImage(named: url)
    }
}
