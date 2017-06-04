//
//  ViewController.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-26.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit
import ResearchKit



class ViewController: UIViewController {

    @IBOutlet weak var join_2: UIButton!

   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bord_c : UIColor = UIColor.init(red: 0, green: 119, blue: 250, alpha: 1)
        
        join_2.layer.cornerRadius = 4
        join_2.layer.borderWidth = 2
        join_2.layer.borderColor = bord_c.cgColor;
        
        
        
        
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
}


