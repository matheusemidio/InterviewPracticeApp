//
//  MenuViewController.swift
//  InterviewPracticeApp
//
//  Created by Matheus Cadena on 2022-02-16.
//

import UIKit

class MenuViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Declaration of variables
    var pickerData : [[String]] = [["HR", "Technical"],
                                   ["Practice", "New"]]
    var typeSelection : String = "HR"
    var modeSelection : String = "Practice"
    
    //Declaration of Outlets
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerViewOutlet.delegate = self
        self.pickerViewOutlet.dataSource = self
    }
    
    //Number of collumns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //The numbers of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    //Data for the rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    //Get the selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if(pickerData[component][row] == "Practice" || pickerData[component][row] == "New")
        {
            self.modeSelection = pickerData[component][row]
        }else if(pickerData[component][row] == "HR" || pickerData[component][row] == "Technical")
        {
            self.typeSelection = pickerData[component][row]
        }

        print(self.typeSelection)
        print(self.modeSelection)
    }


    @IBAction func btnSubmitTouchUp(_ sender: Any)
    {
        //print(self.modeSelection!)
        if(self.modeSelection == "Practice")
        {
            self.performSegue(withIdentifier: Segue.toPracticeQuestion, sender: nil)
        } else if(self.modeSelection == "New")
        {
            self.performSegue(withIdentifier: Segue.toNewQuestion, sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Segue.toPracticeQuestion)
        {
            let practiceQuestionViewController  = (segue.destination as! PracticeQuestionViewController)
            practiceQuestionViewController.typeData = self.typeSelection
        }else if(segue.identifier == Segue.toNewQuestion)
        {
            let newQuestionViewController = (segue.destination as! NewQuestionViewController)
            newQuestionViewController.typeData = self.typeSelection
        }
        
        
        
    }
    
}
