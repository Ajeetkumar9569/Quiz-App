//
//  NextViewController.swift
//  login2
//
//  Created by students on 15/04/24.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var FINDCOURSE: UITextField!
    @IBOutlet weak var Course: UITextField!
    
    @IBOutlet weak var enterCourse: UITextField!
    
    
    @IBOutlet weak var Year: UITextField!
    
    @IBOutlet weak var enterYear: UITextField!
    @IBOutlet weak var Subject: UITextField!
    
    
    @IBOutlet weak var enterSubject: UITextField!
    
    @IBOutlet weak var NEXT: UIButton!
    
    
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
        if textField == enterCourse{
            if textField.text?.count ?? 0 > 10{
                return false
            }
        }
        if textField == enterYear{
            if textField.text?.count ?? 0 > 4{
                return false
            }
        }
        if textField == enterSubject{
            if textField.text?.count ?? 0 > 15{
                return false
            }
        }
        return true
    }
    
    @IBAction func loginbuttonpressed(_ sender: Any) {
        
    
        
        if enterCourse.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill Course", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "thik h", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }else if enterYear.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill year", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "thik h ", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else if enterSubject.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please fill subject name", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "ab samjha", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartquizeViewController")
            self.navigationController?.pushViewController(controller, animated: true)
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
