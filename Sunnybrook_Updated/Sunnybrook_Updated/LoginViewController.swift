//
//  LoginViewController.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-21.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {
    
    
    public var loginData = userModel()
    
    
    
    @IBOutlet weak var user: UITextField!
    
    
   
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        loginData.login = user.text!
    
        
        var tabBar: SunnybrookTabBarController = segue.destination as! SunnybrookTabBarController
        
        
        tabBar.loginData = loginData
        
        
        
        
    }
    
    
    
    
    


}
