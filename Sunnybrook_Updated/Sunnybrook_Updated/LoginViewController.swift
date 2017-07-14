//
//  LoginViewController.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-21.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    public var loginData = userModel()
    
    
    
    @IBOutlet weak var user: UITextField!
    
    
    @IBOutlet weak var passTextField: UITextField!
   
    
    

    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
 
        
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        user.delegate = self
        user.returnKeyType = .done
      
        
        passTextField.delegate = self
        passTextField.returnKeyType = .done
     
    }
    
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        user.resignFirstResponder()
        passTextField.resignFirstResponder()
        return true
    }
    

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        loginData.login = user.text!
        loginData.pass = passTextField.text!
        
        var tabBar: SunnybrookTabBarController = segue.destination as! SunnybrookTabBarController
        
        
        tabBar.loginData = loginData
        
        
        
        
    }
    
   public func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }
    
   public func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    
    // Lifting the view up
    public func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    
    
    
    


}
