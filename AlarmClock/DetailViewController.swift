import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var date: UITextField!
    @IBOutlet var place: UITextField!
    @IBOutlet var time: UITextField!
    
    var schArray: [[String]] = []
    var cellNumD: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveData: UserDefaults = UserDefaults.standard
        schArray = saveData.object(forKey: "array") as! [[String]]
        date.text = schArray[cellNumD][0]
        place.text = schArray[cellNumD][1]
        time.text = schArray[cellNumD][2]

        // Do any additional setup after loading the view.
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
