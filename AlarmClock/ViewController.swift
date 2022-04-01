//
//  ViewController.swift
//  AlarmClock
//
//  Created by Mitsu Kumagai on 2021/12/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var YMD: UILabel!
    @IBOutlet var Now : UILabel!
    @IBOutlet var toList: UIButton!
    @IBOutlet var schF: UITextView!
    @IBOutlet var schS: UITextView!
    
    var date = Date()
    var timer : Timer!
    var schArray: [[String]] = []
    
    let df = DateFormatter()
    let dfs = DateFormatter()
    let saveData: UserDefaults = UserDefaults.standard
    
    //    df.dateFormat = "yyyy.MM.dd.HH:mm:ss"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if saveData.object(forKey: "array") != nil{
            schArray = saveData.object(forKey: "array") as! [[String]]
            schF.text = schArray[0][0] as? String
            schS.text = schArray[1][0] as? String
        }
        startTimer()
        df.dateFormat = "HH:mm:ss"
        df.locale = Locale.current
        dfs.dateFormat = "Y/M/D(E)"
        dfs.locale = Locale.current
        if saveData.object(forKey: "array") == nil{
            toList.isEnabled = false
        }else{
            toList.isEnabled = true
        }
        
//        if schArray != nil{
//            schF.text = schArray[0][0] as? String
//            schS.text = schArray[1][0] as? String
//        }else{
//            schF.text = ""
//            schS.text = ""
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
    }
    
    @objc func up(){
        date = Date()
        Now.text = df.string(from: date)
        YMD.text = dfs.string(from: date)
    }
    
}

