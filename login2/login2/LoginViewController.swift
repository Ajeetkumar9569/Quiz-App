//
//  LoginViewController.swift
//  login2
//
//  Created by students on 15/04/24.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
@IBOutlet weak var LOGIN: UILabel!
@IBOutlet weak var name: UITextField!
@IBOutlet weak var username: UITextField!
@IBOutlet weak var pass: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "nextViewController")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    @IBAction func findcourse(_ sender: Any) {
        
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signupViewController")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
    }
    //    @IBOutlet weak var Login: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == ""
        {
            return true
        }
        if textField == username{
            if textField.text?.count ?? 0 > 15{
                return false
            }
        }
        if textField == password{
            if textField.text?.count ?? 0 > 8{
                return false
            }
        }
        return true
    }
    
    @IBAction func loginbuttonpressed(_ sender: Any) {
        
    
        
        if username.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill username", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }else if password.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill password", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
//            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "nextViewController")
//            self.navigationController?.pushViewController(controller, animated: true)
        }
    
        
       
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
