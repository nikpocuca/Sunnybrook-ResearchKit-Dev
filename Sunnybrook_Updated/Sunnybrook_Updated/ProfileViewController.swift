//
//  ProfileViewController.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-29.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    
    @IBOutlet weak var profileName: UILabel!
    
    
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tbvc = self.tabBarController as! SunnybrookTabBarController
        
        let tabData = tbvc.loginData

        
        
        profileName.text! = tabData.login
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
