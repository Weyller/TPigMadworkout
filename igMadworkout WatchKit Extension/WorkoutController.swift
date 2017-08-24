//=========================
import WatchKit
import Foundation
//=========================

class WorkoutController: WKInterfaceController {
    
    //---------- View to display the exercices
    @IBOutlet var displayLabel: WKInterfaceLabel!
    
    //---------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let temp = context as? [String : String]
        
        displayLabel.setText(temp?["workout"])
        
    }
    
    //---------------------
    
}
//==========================
