//
//  DetalleRoutineViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/20/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class DetalleRoutinesViewController: UIViewController {
    var nom = "";
    var descrip = "";
    @IBOutlet weak var routineTitle: UILabel!
    @IBOutlet weak var routineDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(url: "grey_bg.jpeg", target: self)
        routineTitle.text = nom
        routineDesc.text = descrip
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
