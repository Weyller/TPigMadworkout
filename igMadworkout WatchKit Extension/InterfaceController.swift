
//===================================
import WatchKit
import Foundation
import WatchConnectivity
//===================================


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    // MARK: Variable Declaration
    //----------------------------------------
    @IBOutlet var table: WKInterfaceTable!
    //----------------------------------------
    
    var data: [String : String] = [:]
    var dates: [String] = []
    var workouts: [String] = []
    //-------------------
    
    var session: WCSession!
    //------------------------------------------------
    
    // Method to manage userDefaults
    func userDefaultmanager() {
        
        if UserDefaults.standard.object(forKey: "data") == nil {
            
            UserDefaults.standard.set(data, forKey: "data")
        } else {
            data = UserDefaults.standard.object(forKey: "data") as! [String : String]
        }
    }
    // Method to reload data in view
    //------------------------------------------------
    func tableRefresh() {
        
        table.setNumberOfRows(data.count, withRowType: "row")
        for index in 0..<table.numberOfRows {
            let row = table.rowController(at: index) as! TableRowController
            row.dates.setText(dates[index])
        }
    }
    
    // MARK: Methods for Watch
    //------------------------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
    }
     //------------------------------------------------
    override func willActivate() {
         //--------------------
        super.willActivate()
        //---------------------
        if WCSession.isSupported() {
            session = WCSession.default()
            session.delegate = self
            session.activate()
        }
        //----------------------
        userDefaultmanager()
        //----------------------
        self.dates = Array(data.keys)
        self.workouts = Array(data.values)
        tableRefresh()
    }
    //------------------------------------------------
    override func didDeactivate() {
        super.didDeactivate()
    }
    //------------------------------------------------
    @available(watchOS 2.2, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //...code
    }
    
    // MARK: Method for Watch session
    //------------------------------------------------
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        //----------------------------
        let value = message["Message"] as? [String : String]
        //----------------------------
        DispatchQueue.main.async { () -> Void in
            self.data = value!
            UserDefaults.standard.set(self.data, forKey: "data")
            self.dates = Array(value!.keys)
            self.workouts = Array(value!.values)
            self.tableRefresh()
        }
        //---------
        //replyHandler(["Message" : conversation])
    }
    //-----------------------------------------------
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        self.pushController(withName: "page2", context: ["workout" : workouts[rowIndex]])
    }
    

}
//=================================================














