//
//  EditViewController.swift
//  AlarmClock
//
//  Created by Mitsu Kumagai on 2021/12/11.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet var DateA: UIDatePicker!
    @IBOutlet var Place: UITextField!
    @IBOutlet var Leave: UIDatePicker!
    @IBOutlet var Arrive: UIDatePicker!
    
    let dateFormatter = DateFormatter()
    let saveData: UserDefaults = UserDefaults.standard
    let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました", preferredStyle: .alert)
    
    var date: Date!
    var place: String!
    var LeaveTime: Date!
    var ArriveTime: Date!
    var taskArray: [[String]] = []
    var cellNumD: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.locale = Locale.current
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if saveData.object(forKey: "array") != nil{
        taskArray = saveData.object(forKey: "array") as! [[String]]
       print(taskArray)
        }
        if cellNumD != nil{
            Place.text = taskArray[cellNumD][1]
            Arrive.date = dateFormatter.date(from: taskArray[cellNumD][3]) as! Date
            Leave.date = dateFormatter.date(from: taskArray[cellNumD][2]) as! Date
        }
    }
    
    @IBAction func save(){
        date = DateA.date
        place = Place.text!
        LeaveTime = Leave.date
        ArriveTime = Arrive.date
        taskArray.append([dateFormatter.string(from: date),place,dateFormatter.string(from: LeaveTime),dateFormatter.string(from: ArriveTime)])
        saveData.set(taskArray, forKey: "array")
        
//        self.dismiss(animated: true, completion: nil)
         
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
