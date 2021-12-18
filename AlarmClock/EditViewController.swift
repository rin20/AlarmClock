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
    var ReadyTime: Date!
    var MoveTime: Date!
    var ArriveTime: Date!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        ReadyTime = Ready.date
        MoveTime = Move.date
        ArriveTime = Arrive.date
        print("あああ",ArriveTime)
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
