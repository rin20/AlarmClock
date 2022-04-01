//
//  TableViewCell.swift
//  AlarmClock
//
//  Created by Mitsu Kumagai on 2022/02/05.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var cellDate: UILabel!
    @IBOutlet var cellPlace: UILabel!
    @IBOutlet var cellTime: UILabel!
    
    var schArray: [[String]] = []
    
    let saveData: UserDefaults = UserDefaults.standard

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        schArray = saveData.object(forKey: "array") as! [[String]]
//        cellDate.text = schArray[indexPath.row][0]
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
