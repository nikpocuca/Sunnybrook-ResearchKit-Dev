//
//  SunnybrookTabBarController.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-31.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import UIKit


public class SunnybrookTabBarController: UITabBarController {
    
  public var dataCounter = DataSource()
    
  public var loginData = userModel()
    
    
    
  public  let bord_c : UIColor = UIColor.init(red: 125, green: 66, blue: 244, alpha: 1)
    
    
    
    override public func viewDidLoad(){
        self.tabBar.tintColor = UIColor.blue
        
    }
    
    
    
    
}
