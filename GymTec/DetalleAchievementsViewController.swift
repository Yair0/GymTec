//
//  DetalleAchievementsViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/21/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class DetalleAchievementsViewController: UIViewController {
    var nom = ""
    var date = ""
    var desc = ""
    @IBOutlet weak var achievementTitle: UILabel!
    @IBOutlet weak var achievementDate: UILabel!
    @IBOutlet weak var achievementDesc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(url: "grey_bg.jpeg", target: self)
        achievementTitle.text = nom
        achievementDate.text = date
        achievementDesc.text = desc
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
