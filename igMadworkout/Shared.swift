// ============================
import UIKit
// ============================
class Shared: UIViewController
{
    //MARK: Variables Declaration
    // ============================
    var theDatabase: [String : [[String : String]]]!
    var savedUserDefault: UserDefaults = UserDefaults.standard
    static let sharedInstance = Shared()
    var theRow: Int!
    
    // Method that validate a user default by string
    // ============================
    func checkForUserDefaultByName(_ theName: String, andUserDefaultObject: UserDefaults) -> Bool
    {
        let userDefaultObject = andUserDefaultObject.object(forKey: theName)
        
        if userDefaultObject == nil
        {
            return false
        }
        
        return true
    }
    // Method to that saves to or load data from useDefault
    // ============================
    func  saveOrLoadUserDefaults(_ name: String)
    {
       //self.savedUserDefault.removeObjectForKey(name)
        
        if !self.checkForUserDefaultByName(name, andUserDefaultObject: self.savedUserDefault)
        {
            var tempArray = ["" : [["" : ""]]]
            tempArray[""] = nil
            
            self.saveUserDefaultByName(name, andUserDefaultObject: self.savedUserDefault, andSomeValue: tempArray)
        }
        else
        {
           self.theDatabase = self.savedUserDefault.value(forKey: name) as! [String : [[String : String]]]
        }
    }
    // Methods that sets the values in userDefault
    // ============================
    func saveUserDefaultByName(_ theName: String, andUserDefaultObject: UserDefaults, andSomeValue: [String : [[String : String]]])
    {
        andUserDefaultObject.setValue(andSomeValue, forKey: theName)
    }
    // Method that returns thhe data from userDefault
    // ============================
    func getDatabase(_ name: String) -> [String : [[String : String]]]
    {
        return self.savedUserDefault.value(forKey: name) as! [String : [[String : String]]]
    }
    // Method to save database in userDefault
    // ============================
    func saveDatabase(_ valueToSave: [String : [[String : String]]])
    {
        self.savedUserDefault.setValue(valueToSave, forKey: "db")
    }
    // ============================
}







