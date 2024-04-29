//
//  DashBoardViewController.swift
//  login2
//
//  Created by students on 16/04/24.
//

import UIKit


class QuizeQuestionSection{
    
    var questionString:String = ""
    var ans:String = ""
    var rows:[QuizeAnsRows] = []
    var options: [String] = []
    
    init(questionString1:String ,rows1:[QuizeAnsRows],ans1:String )
    {
        questionString = questionString1
        rows = rows1
        ans = ans1
    }
    
}

class QuizeAnsRows{
    
    var option:String = ""
    var isSelected:Bool =  false
  
    init(option1:String ,isSelected1:Bool){
        option = option1
        isSelected = isSelected1
        
      
        
        
        
    }
}


class DashBoardViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    var score = 0
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var dashTableView: UITableView!
    var sectionArray:[QuizeQuestionSection] = []
    
    var rightCount:Int = 0
    
    var ansArray:[Int] = []
    
    
    //let rowsArray =
   // [["name":"Ajeet kumar"],["name":"Ram"],["name":"Shyam"],["name":"kumar"],["name":"Kajol"],["name":"Arma"],["name":"s kumar"]]
   
    @IBOutlet weak var SkipButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    
    @IBOutlet weak var SubmitButton: UIButton!
   
    @IBAction func submitButton1(_ sender: Any) {
        
       
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finalViewController")
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
//func checkAnswer(selectedOption: String, selectedButton: UIButton) {
//    let correctAnswer = correctAnswers[]
//    
//    
//    
//    
//            if selectedOption == correctAnswer {
//                score += 1
//                selectedButton.backgroundColor = UIColor.green.withAlphaComponent(0.5)
//            } else {
//                selectedButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
//                // Highlight the correct answer by changing its background color
//                if let correctButton = findCorrectButton() {
//                    correctButton.backgroundColor = UIColor.green.withAlphaComponent(0.5)
//                }
//            }
//            currentQuestionIndex += 1
//            if currentQuestionIndex < questions.count {
//                displayQuestion()
//            } else {
//                showScore()
//            }
//        }
    
    
    func showScore() {
        
        for  section in  self.sectionArray{
            
            for row in section.rows
            {
                if row.isSelected{
                    if row.option == section.ans{
                        self.rightCount = self.rightCount + 1
                    }
                }
               
                
                
            }
        }
       
        
        
        
        let alert = UIAlertController(title: "Quiz Completed", message: "Your score is \(self.rightCount) out of \(self.sectionArray.count)", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (_) in
//                self.restartQuiz()
                
                self.rightCount = 0
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        
        
         
        
        }
                                                  
           
                                                  
    
    
 
                                                  
                                                  
 
    
    
    @IBAction func BackButton(_ sender: UIButton) {
        
        switch nextButton.tag {
        case 1:
            self.nextButton.tag = 0
            
        case 2:
            self.nextButton.tag = 1
           
        case 3:
            self.nextButton.tag = 2
          
        case 4:
            self.nextButton.tag = 3
          
        case 5:
            self.nextButton.tag = 4
       
        default:
            print()
        }
        dashTableView.reloadData()
    }
    
    @IBAction func SkipButton(_ sender: UIButton) {
        let objectS =  self.sectionArray[nextButton.tag]
            
            
            for objectR in  objectS.rows{
                if objectR.isSelected == true{
                    objectR.isSelected = false
                }
                
            }
      
        
        
        switch nextButton.tag {
        case 0:
            self.nextButton.tag = 1
           
        case 1:
            self.nextButton.tag = 2
           
        case 2:
            self.nextButton.tag = 3
          
        case 3:
            self.nextButton.tag = 4
            
        case 4:
            self.nextButton.tag = 5
           
        default:
          print()
        }
        dashTableView.reloadData()
    }
    
    
    @IBAction func Nextbutton(_ sender: UIButton) {
        var isSelected = false
        let objectS =  self.sectionArray[nextButton.tag]
            
                
            for objectS in  objectS.rows{
                if objectS.isSelected == true{
                    isSelected = true
                }
            }
        for objectR in  objectS.rows{
            if objectS.questionString == objectS.ans{
                self.score = self.score + 1
                break
            }
        }
        if isSelected == false{
            let alert = UIAlertController(title: "Alert", message: "Please select option", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    
        }else{
            switch sender.tag {
            case 0:
                self.nextButton.tag = 1
               
            case 1:
                self.nextButton.tag = 2
              
            case 2:
                self.nextButton.tag = 3
                
            case 3:
                self.nextButton.tag = 4
            case 4:
                self.nextButton.tag = 5
            case 5:
                showScore()
            default:
                self.nextButton.tag = 0
               
            }
            dashTableView.reloadData()
        }
        
        
       
            
       
        
        
      
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionTableViewCell") as! SectionTableViewCell
        cell.question.text = self.sectionArray[nextButton.tag].questionString
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      let section1 =  self.sectionArray[nextButton.tag]
        return section1.rows.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashTableViewCell", for: indexPath) as! DashTableViewCell
        let section =  self.sectionArray[nextButton.tag]
        
        cell.namelabel.text = section.rows[indexPath.row].option
       
        
        cell.Buttoncircle.tag = indexPath.row
        cell.Buttoncircle.imageView?.tag =  nextButton.tag
        
        
        cell.Buttoncircle.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        if section.rows[indexPath.row].isSelected{
        
         
            cell.Buttoncircle.setImage(UIImage.init(systemName: "circle.circle"), for: .normal)
            
        }else{
            
            cell.Buttoncircle.setImage(UIImage.init(systemName: "circle"), for: .normal)
         
            
        }
        
        
        
        return cell
        
    }
    @objc func buttonClicked(sender:UIButton){
     
        
        let row = sender.tag
        let section = sender.imageView?.tag ?? 0
        let rowArray =  self.sectionArray[section].rows
        
        for object in rowArray{
            object.isSelected = false
            
        }
        
        let option = rowArray[row].option
        rowArray[row].isSelected = true
        
        self.dashTableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       /* let section =  self.sectionArray[indexPath.section]
        
        let option = section.rows[indexPath.row].option
        
        if option == section.ans{
            self.rightCount = self.rightCount + 1
        }
        print(option)
        
        switch indexPath.row {
        case 0:
            self.secondQuestion()
        case 1:
            self.thiredQuestion()
        default:
            firstQuestion()
        }
        
        */
    }
    
  

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
      
        
        
        firstQuestion()
        secondQuestion()
        thiredQuestion()
        fourethQuestion()
        fifthQuestion()
        sixQuestion()
        
      
        self.dashTableView.reloadData()
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    func firstQuestion(){
        var rowsArray2:[QuizeAnsRows] = []
        rowsArray2.append(QuizeAnsRows.init(option1: "Media Acces Code", isSelected1: false))
        rowsArray2.append(QuizeAnsRows.init(option1: "Media Acces Command", isSelected1: false))
        rowsArray2.append(QuizeAnsRows.init(option1: "Media Acces Control", isSelected1: false))
        rowsArray2.append(QuizeAnsRows.init(option1: "Media Authentication Control", isSelected1: false))
        
        sectionArray.append(QuizeQuestionSection.init(questionString1: "1. What is full name of MAC ?", rows1: rowsArray2,ans1: "Media Acces Control"))
        dashTableView.reloadData()
    }
    
    func secondQuestion(){
        
        var rowsArray:[QuizeAnsRows] = []
        rowsArray.append(QuizeAnsRows.init(option1: "Gigabyte Byte", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Gigantic Byte", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Giga Byte", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Global Byte", isSelected1: false))
        
        sectionArray.append(QuizeQuestionSection.init(questionString1: "2. What is full name of GB?", rows1: rowsArray,ans1: "Giga Byte"))
        dashTableView.reloadData()
      
        
    }
    func thiredQuestion(){
       
        var rowsArray:[QuizeAnsRows] = []
        rowsArray.append(QuizeAnsRows.init(option1: "Vanus", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Mars", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Jupiter", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Saturn", isSelected1: false))
        
        sectionArray.append(QuizeQuestionSection.init(questionString1: "3. Which planet is known as the Red Planet ?", rows1: rowsArray,ans1: "Mars"))
        dashTableView.reloadData()
      
        
    }
    
    func fourethQuestion(){
      
        var rowsArray:[QuizeAnsRows] = []
        rowsArray.append(QuizeAnsRows.init(option1: "Mars", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Jupiter", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Saturn", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Mars", isSelected1: false))
        
        sectionArray.append(QuizeQuestionSection.init(questionString1: "4. Which planet is the smallest in our solar system ?", rows1: rowsArray,ans1: "Jupiter"))
        dashTableView.reloadData()
      
        
    }
    
    func fifthQuestion(){
      
        var rowsArray:[QuizeAnsRows] = []
        rowsArray.append(QuizeAnsRows.init(option1: "Vanus", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Mars", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Jupiter", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Saturn", isSelected1: false))
        
        
        sectionArray.append(QuizeQuestionSection.init(questionString1: "5.Which planet has the largest rings  in our solar system ?  ?", rows1: rowsArray,ans1: "Saturn"))
        dashTableView.reloadData()
      
        
    }
    
    
    func sixQuestion(){
      
        var rowsArray:[QuizeAnsRows] = []
        rowsArray.append(QuizeAnsRows.init(option1: "Bachelor's in Technology", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Bachelor of Technology", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Bachelor's of Technology", isSelected1: false))
        rowsArray.append(QuizeAnsRows.init(option1: "Bachelor in Technology", isSelected1: false))
        
        sectionArray.append(QuizeQuestionSection.init(questionString1: "6. What is full name of B-tech ?", rows1: rowsArray,ans1: "Bachelor of Technology"))
        dashTableView.reloadData()
      
        
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
