//
//  SignUpViewController.swift
//  GymTec
//
//  Created by Yair Pimentel on 3/26/19.
//  Copyright © 2019 Yair Pimentel. All rights reserved.
//

//Extension a la clase UIToolBar para añadir un boton Done
extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!

    //Inicializar el DatePicker
    private var datePicker = UIDatePicker()
    var pickOption = ["Male", "Female", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        setBackground(url: "gym_pattern3.png", target: self)
=======
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "gymPattern.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
>>>>>>> origin/master
        
        
        //Picker View for Sex
        let weightPicker = UIPickerView()
        weightPicker.delegate = self
        sexTextField.inputView = weightPicker
        
        //ToolBar para añadir un Done al DatePicker
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissPicker))
        
        //Añadir la fecha al textField
        dateTextField.inputAccessoryView = toolBar
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -14, to: Date())
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        dateTextField.inputView = datePicker

        //Esconder teclado al presionar cualquier lado de la pantalla
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
        
        //Delegates
        nameTextField.delegate=self
        emailTextField.delegate=self
        passwordTextField.delegate=self
        weightTextField.delegate=self
        heightTextField.delegate=self
        sexTextField.delegate=self
        dateTextField.delegate=self
        
    }
    
    
    //Functions to sex picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexTextField.text = pickOption[row]
    }
    
    
    
    //Ocultar datePicker
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    //Darle formato a la fecha cuando sea cambiada
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    //Funcion para esconder el teclado
    @objc func hideKeyBoard (){
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        view.endEditing(true)
    }
    
    //Funcion para esconder el teclado al tocar el boton enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyBoard()
        return true
    }
    
    //Funcion que valida que el correo este bien colocado
    @IBAction func validateEmail(_ sender: UITextField) {
        if(emailTextField.isEmail()){
            validationLabel.text = "Valid Email Format"
            validationLabel.textColor = UIColor(displayP3Red: 0.28, green: 0.98, blue: 0.28, alpha: 1)
            emailTextField.backgroundColor = UIColor(displayP3Red: 0.28, green: 0.98, blue: 0.28, alpha: 1)
        }else{
            validationLabel.text = "Wrong Email Format"
            validationLabel.textColor = UIColor(displayP3Red: 0.99, green: 0.28, blue: 0.28, alpha: 1)
            emailTextField.backgroundColor = UIColor(displayP3Red: 0.99, green: 0.28, blue: 0.28, alpha: 1)
            
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
