//
//  ViewController.swift
//  igMadworkout
//
//  Created by eleves on 2017-07-17.
//  Copyright © 2017 w. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    //-----------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //=====================================
    
    @IBAction func hideKeyboard(_ sender: UIButton) {
        
        self.view.endEditing(true)
    }
   
    

}

