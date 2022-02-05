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
    var date = Date()
    var timer : Timer!
    let df = DateFormatter()
    let dfs = DateFormatter()
    
//    df.dateFormat = "yyyy.MM.dd.HH:mm:ss"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        startTimer()
        df.dateFormat = "HH:mm:ss"
        df.locale = Locale.current
        dfs.dateFormat = "Y/M/D(E)"
        dfs.locale = Locale.current
        if timer.isValid == true{
        }
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

