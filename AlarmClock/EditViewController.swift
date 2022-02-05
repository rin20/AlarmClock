//
//  EditViewController.swift
//  AlarmClock
//
//  Created by Mitsu Kumagai on 2021/12/11.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet var NowDate: UIDatePicker!
    @IBOutlet var Ready: UIDatePicker!
    @IBOutlet var Move: UIDatePicker!
    @IBOutlet var Arrive: UIDatePicker!
    
    var Now: Date = Date()
    var ReadyTime: TimeInterval!
    var MoveTime: TimeInterval!
    var ArriveTime: Date!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func save(){
        ReadyTime = Ready.countDownDuration
        MoveTime = Move.countDownDuration
        ArriveTime = Arrive.date
        print("あああ",ArriveTime)
        let span = Date(timeInterval: -MoveTime, since: ArriveTime)
        print("いい",span)
        let spanS = Date(timeInterval: -ReadyTime, since: span)
        print("ううう",spanS)
//        let spanC = span / 3600 + ":" + (span % 3600) / 60 + "/" + (span % 3600) % 60
//        let spanS = spanC.timeIntervalSince(MoveTime)
        
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
