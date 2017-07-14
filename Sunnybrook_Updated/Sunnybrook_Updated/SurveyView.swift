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
        
        let loginData = tbvc.loginData
        // create here update function.
        
        
        
    }

    
    let ConsentReviewStepIdentifier = "ConsentReviewStep"
    let consentDocument = ORKConsentDocument()
    
    
    
    @IBAction func consent_tap(_ sender: Any) {
        
        consentDocument.title = NSLocalizedString("Sunnybrook Health Study Consent Form", comment: "")
        
        
        let section1 = ORKConsentSection(type: .overview)
        section1.summary = NSLocalizedString("Overview for Mity Kids Trial - Type 2 Diabetes", comment: "Participation in this study is voluntary")
        section1.content = NSLocalizedString("You have been asked to take part in this trial because you have participated in the Mity trial. There is some evidence that children of mothers with diabetes have a higher than average chance of developing diabetes themselves, and having risk factors for herat disease.", comment: "")
        
        
        
        let section2 = ORKConsentSection(type: .dataGathering)
        section2.summary = NSLocalizedString("Data Gathering", comment: "")
        section2.content = NSLocalizedString("Various measurements will be taken, weight, length, skinfolds, head and waist circumferences.", comment: "")
        
        
        let section3 = ORKConsentSection(type: .privacy)
        section3.summary = NSLocalizedString("Confidentiality: Personal Health Information", comment: "")
        section3.content = NSLocalizedString("If you agree to join this study, the doctor and his/her study team will look at your personal health information and collect only the information they need for the study. Personal health information that could be used to identify you includes your name, address, date of birth, and new or existing medical records at this hospital.", comment: "")
        
        consentDocument.sections = [section1, section2, section3]
        
        
        let signature = ORKConsentSignature(forPersonWithTitle: "Participant", dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        consentDocument.addSignature(signature)
        
        
        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
        
        let reviewConsentStep = ORKConsentReviewStep(identifier: ConsentReviewStepIdentifier, signature: signature, in: consentDocument)
        
        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
        passcodeStep.text = "Now you will create a passcode to identifiy yourself to the app and protect access to the information you've entered"
        
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = NSLocalizedString("Welcome aboard.", comment: "")
        completionStep.text = NSLocalizedString("Thank you for joining this study.", comment: "")
        
        
        let fullsteps = [consentStep,reviewConsentStep,passcodeStep,completionStep]
        
        
        let orderedTask = ORKOrderedTask(identifier: "Join", steps: fullsteps)
        
        
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRun: nil)
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
        
        
       // print(parsed_data)
        //print(scored_data)
        
        let tbvc = self.tabBarController as! SunnybrookTabBarController

        var tabData = tbvc.loginData
    
        
        tabData.surveyScore = scored_data
        tabData.update()
        print(tabData.items)

        
        tabData = sqlUpdate(model: tabData)
        
       // print(tabData.items)
        
        
      //  sqlFunction(id: tabData.id , Name: tabData.login, score: scored_data)
        
        
        

        
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

   }
} // end of view controller
    
    

    
    
    


