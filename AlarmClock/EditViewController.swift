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
    
    var date: Date!
    var place: String!
    var ReadyTime: TimeInterval!
    var MoveTime: TimeInterval!
    var ArriveTime: Date!
    var taskArray: [[String]] = [["日付"],["場所"],["出発時間"],["到着時間"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        date = DateA.date
        place = Place.text
        ReadyTime = Ready.countDownDuration
        MoveTime = Move.countDownDuration
        ArriveTime = Arrive.date
    }
    
    @IBAction func save(){
        let format = dateFormatter.string(from: date)
        let formatS = dateFormatter.string(from: ArriveTime)
        let span = Date(timeInterval: -MoveTime, since: ArriveTime)
        let spanS = Date(timeInterval: -ReadyTime, since: span)
        let formatT = dateFormatter.string(from: spanS)
        taskArray.append([format,place,formatS,formatT])
        print(taskArray)
        
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
