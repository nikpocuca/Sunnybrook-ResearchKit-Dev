//
//  ConsentTask.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-12.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit


public var ConsentTask: ORKOrderedTask {

    let ConsentReviewStepIdentifier = "ConsentReviewStep"
    let consentDocument = ORKConsentDocument()

    
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
    

    return ORKOrderedTask(identifier: "ConsentTask", steps: fullsteps)

}
