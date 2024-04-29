//
//  StartquizeViewController.swift
//  login2
//
//  Created by students on 15/04/24.
//

import UIKit

class StartquizeViewController: UIViewController {
    
    
    @IBOutlet weak var raeady: UILabel!
    

    @IBAction func nextButton(_ sender: Any) {
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dashBoardViewController")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
