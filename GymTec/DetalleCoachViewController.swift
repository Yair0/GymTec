//
//  DetalleCoachViewController.swift
//  GymTec
//
//  Created by cdt307 on 3/19/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class DetalleCoachViewController: UIViewController {
    var nombreRecibido = "";
    var specRecibido = "";
    var numRecibido = "";
    var mailRecibido = "";
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var spec: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var mail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = nombreRecibido
        spec.text = specRecibido
        num.text = numRecibido
        mail.text = mailRecibido
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
