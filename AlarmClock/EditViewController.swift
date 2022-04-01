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
    @IBOutlet var Ready: UIDatePicker!
    @IBOutlet var Move: UIDatePicker!
    @IBOutlet var Arrive: UIDatePicker!
    
    let dateFormatter = DateFormatter()
    let saveData: UserDefaults = UserDefaults.standard
    let alert: UIAlertController = UIAlertController(title: "", message: "保存が完了しました", preferredStyle: .alert)
    
    var date: Date!
    var place: String!
    var ReadyTime: TimeInterval!
    var MoveTime: TimeInterval!
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
        taskArray = saveData.object(forKey: "array") as! [[String]]
       print(taskArray)
        if cellNumD != nil{
            Place.text = taskArray[cellNumD][1]
            Arrive.date = dateFormatter.date(from: taskArray[cellNumD][2]) as! Date
        }
    }
    
    @IBAction func save(){
        date = DateA.date
        place = Place.text!
        ReadyTime = Ready.countDownDuration
        MoveTime = Move.countDownDuration
        ArriveTime = Arrive.date
        let span = Date(timeInterval: -MoveTime, since: ArriveTime)
        let spanS = Date(timeInterval: -ReadyTime, since: span)
        let formatT = dateFormatter.string(from: spanS)
        taskArray.append([dateFormatter.string(from: date),place,dateFormatter.string(from: ArriveTime),dateFormatter.string(from: spanS)])
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
