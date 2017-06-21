//
//  SurveyView.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-26.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit




class Survey: UIViewController {
    
    
   

    
    // connect button
    @IBAction func survey_tap(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
       
        
        // load in data from tabBarController
        let tbvc = self.tabBarController as! SunnybrookTabBarController
        tbvc.dataCounter.perCent += 34
    }

    
    let ConsentReviewStepIdentifier = "ConsentReviewStep"
    let consentDocument = ORKConsentDocument()
    
    
    
    @IBAction func consent_tap(_ sender: Any) {
  
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        
        // load in data from tabBarController
        let tbvc = self.tabBarController as! SunnybrookTabBarController
        tbvc.dataCounter.perCent += 33
    }
    
    

    
    @IBAction func imageSurvey_tap(_ sender: Any) {
        
        let taskViewController = ORKTaskViewController(task: ImageSurveyTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        
        // load in data from tabBarController
        let tbvc = self.tabBarController as! SunnybrookTabBarController
        tbvc.dataCounter.perCent += 33

        
        
        
    }
    
    
    
    @IBAction func walk_tap(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SpacialTask, taskRun: nil)
        taskViewController.delegate = self

        present(taskViewController, animated: true, completion: nil)

        
    }
    
    
    
    
    @IBAction func ipaq_tap(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: ipaqTask, taskRun: nil)
        taskViewController.delegate = self

        
        present(taskViewController, animated: true, completion: nil)

    }
    
    
    
    
    @IBAction func toh_tap(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: TOHTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func tap_tap(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: TappingTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension Survey : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
        
        
        
        // initialize names array.
        let names: Array<String> = ["grainTextChoiceQuestionStep","milkChoiceQuestionStep","vegChoiceQuestionStep","meatChoiceQuestionStep"]
        
        
        var data: Array<String> = []
        
        // Iterate through names array.
        for name in names {
            if reason == .completed {
                if let stepResult = taskViewController.result.stepResult(forStepIdentifier: name),
                    let stepResults = stepResult.results,
                    let stepFirstResult = stepResults.first,
                    let textResult = stepFirstResult as? ORKChoiceQuestionResult,
                    let textAnswer = textResult.choiceAnswers {
                    var input =  "\(textAnswer)"
                    data += [input]
                }
            }
        }
        
        let method = [[0,1,2,4],[0,1,2,4],[0,1,2,3,4],[0,1,2,3,4]]
        
        
        var parsed_data = Parse(input: data)
        var scored_data = Scorer(input: parsed_data, Method: method)
        
        
        print(parsed_data)
        print(scored_data)
        
        let tbvc = self.tabBarController as! SunnybrookTabBarController

        let tabData = tbvc.loginData
        
        print(tabData.id)
        print(tabData.login)
        
        
        
        sqlFunction(id: tabData.id , Name: tabData.login, score: scored_data)
        
        
        

        /*
        switch reason {
        case .completed:
            let result = taskViewController.result
            if let stepResult = result.stepResult(forStepIdentifier: ConsentReviewStepIdentifier),
                let signatureResult = stepResult.results?.first as? ORKConsentSignatureResult {
                signatureResult.apply(to: consentDocument)
                
                consentDocument.makePDF{ (data, error) -> Void in
                    let tempPath = NSTemporaryDirectory() as NSString
                    let path = tempPath.appendingPathComponent("signature.pdf")
                    do {
                        try data?.write(to: URL(fileURLWithPath:path), options: .atomic)
                        
                    } catch {
                        
                    }
                    print(path)
                }
                
            }
            
        default:
            break
        }
        
        */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

   }
} // end of view controller
    
    

    
    
    


