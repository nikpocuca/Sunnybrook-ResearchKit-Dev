//
//  SQLViewController.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-22.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit

class SQLViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var sqlText: UITextView!
    
    
    @IBOutlet weak var sqlDesign: UIButton!
    
    
    
    
    @IBAction func Query(_ sender: Any) {
        
        // Place SQL code here. Import whatever was in the textfield. 
    let input = sqlText.text!
    
    sqlQuery(qString: input)
    
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sqlText.layer.cornerRadius = 4
        sqlText.layer.borderWidth = 2
     //   sqlText.layer.borderColor = UIColor.purple as! CGColor;
        
        
        sqlDesign.layer.cornerRadius = 4
        sqlDesign.layer.borderWidth = 2
      //  sqlDesign.layer.borderColor = UIColor.purple as! CGColor;
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
