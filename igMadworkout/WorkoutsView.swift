// ============================
import UIKit
// ============================
class WorkoutsView: UIViewController, UITableViewDelegate, UITableViewDataSource 
{
    // ============================
    var theDatabase: [String : [[String : String]]]!
    // ============================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       self.theDatabase = Shared.sharedInstance.getDatabase("db")

    }
    // ============================
    func getDates() -> [String]
    {
        var tempArray = [""]
        
        
        for (a, _) in  self.theDatabase.reversed() {
            tempArray.append(a)
        }
        
        tempArray.remove(at: 0)
        
        return tempArray
    }
    // ============================
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    // ============================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //return 20
        return self.theDatabase.count
    }
    // ============================
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"cell")
        cell.textLabel!.font = UIFont(name: "Caviar Dreams", size: 18.0)
        //cell.textLabel!.text = "hello world"
        cell.textLabel!.text = self.getDates()[indexPath.row]
        tableView.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    // ============================
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
        Shared.sharedInstance.theRow = indexPath.row
        performSegue(withIdentifier: "theSegway", sender: nil)
    }
    // ============================
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            self.theDatabase[self.getDates()[indexPath.row]] = nil
            Shared.sharedInstance.saveDatabase(self.theDatabase)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    // ============================
}























