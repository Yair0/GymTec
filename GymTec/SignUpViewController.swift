//
//  SignUpViewController.swift
//  GymTec
//
//  Created by Yair Pimentel on 3/26/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    
    private var datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker

        //Poner un background con una imagen en la misma carpeta, adaptable a todos los modelos de iPhone
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "app-bg.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Esconder teclado al presionar cualquier lado de la pantalla
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
        
        //Los textfield se delegan a si mismos, proveniente de UITextFieldDelegate
        nameTextField.delegate=self
        emailTextField.delegate=self
        passwordTextField.delegate=self
        weightTextField.delegate=self
        heightTextField.delegate=self
        sexTextField.delegate=self
        dateTextField.delegate=self
        
    }
    
    //@objc func
    
    @objc func hideKeyBoard (){
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        
        
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyBoard()
        return true
    }

    @IBAction func validateEmail(_ sender: UITextField) {
        if(emailTextField.isEmail()){
            validationLabel.text = "Correct email"
        }else{
            validationLabel.text = "Wrong email"
        }
        validationLabel.isHidden = false
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
