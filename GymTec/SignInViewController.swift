//
//  SignInViewController.swift
//  GymTec
//
//  Created by Yair Pimentel on 3/25/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit


class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "app-bg.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Esconder teclado al presionar cualquier lado de la pantalla
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
        
        //Los textfield se delegan a si mismos, proveniente de UITextFieldDelegate
        emailTextField.delegate=self
        passwordTextField.delegate=self
        
        
        

        // Do any additional setup after loading the view.
    }
    
    // UITextFieldDelegate Methodsç
    
    @objc func hideKeyBoard (){
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //emailTextField.resignFirstResponder()
        hideKeyBoard()
        return true
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
