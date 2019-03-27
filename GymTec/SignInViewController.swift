//
//  SignInViewController.swift
//  GymTec
//
//  Created by Yair Pimentel on 3/25/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

import UIKit

//Override String to verify email https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift

let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)

extension String {
    func isEmail() -> Bool {
        return __emailPredicate.evaluate(with: self)
    }
}

extension UITextField {
    func isEmail() -> Bool {
        return self.text!.isEmail()
    }
}



class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Poner un background con una imagen en la misma carpeta, adaptable a todos los modelos de iPhone
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
        
        
    }
    
    // UITextFieldDelegate Methods
    
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
