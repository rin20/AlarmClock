//
//  ListViewController.swift
//  AlarmClock
//
//  Created by Mitsu Kumagai on 2022/02/05.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var schArray: [[String]] = []
    var cellNum: Int!
    
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        schArray = saveData.object(forKey: "array") as! [[String]]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segue"{
            let nextView = segue.destination as! EditViewController
            nextView.cellNumD = cellNum
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        cell.cellDate?.text = schArray[indexPath.row][0]
        cell.cellPlace?.text = schArray[indexPath.row][1]
        cell.cellTime?.text = schArray[indexPath.row][0]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        cellNum = indexPath.row
        self.performSegue(withIdentifier: "segue", sender: nil)
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
