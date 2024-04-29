//
//  SignupViewController.swift
//  login2
//
//  Created by students on 16/04/24.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var Signup: UILabel!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var EnterName: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var EnterEmail: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var EnterPass: UITextField!
    
    @IBOutlet weak var Submit: UIButton!
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


func textFieldShouldReturn(_ textField: UITextField) -> Bool{
    textField.resignFirstResponder()
    return true
}
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if string == ""
    {
        return true
    }
    if textField == EnterName{
        if textField.text?.count ?? 0 > 10{
            return false
        }
    }
    if textField == EnterEmail{
        if textField.text?.count ?? 0 > 8{
            return false
        }
    }
    if textField == EnterPass{
        if textField.text?.count ?? 0 > 8{
            return false
        }
    }
    return true
}
//    @IBAction func signupSubmit(_ sender: Any) {
//        
//        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "nextViewController1")
//        self.navigationController?.pushViewController(controller, animated: true)
//        
//        
//        
//    }
    @IBAction func loginbuttonpressed(_ sender: Any) {
        
    
        
        if EnterName.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill Name", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "thik h", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }else if !self.isValidEmail(EnterEmail.text!){
            let alert = UIAlertController(title: "Alert", message: "Please fill valid Email", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "thik h ", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else if EnterPass.text ?? "" == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill the Pass..", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "ab samjha", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "nextViewController")
            self.navigationController?.pushViewController(controller, animated: true)
        }
    
        
       
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}

