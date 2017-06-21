//
//  ImageSurveyTask.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-12.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit

public var ImageSurveyTask: ORKOrderedTask {

    
    // ---------------------------------------------------------------------
    
    var fullsteps = [ORKStep]()
    let step1title = "Which one of these is a triangle?"
    let step1imagechoices = [ ORKImageChoice(normalImage: #imageLiteral(resourceName: "triangle"), selectedImage: #imageLiteral(resourceName: "triangle"), text: "1", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                              ORKImageChoice(normalImage: #imageLiteral(resourceName: "circle"), selectedImage: #imageLiteral(resourceName: "circle"), text: "2", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKImageChoice(normalImage: #imageLiteral(resourceName: "rhombus"), selectedImage: #imageLiteral(resourceName: "rhombus_s"), text: "3", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
        ]
    let step1AnswerFormat = ORKImageChoiceAnswerFormat(imageChoices: step1imagechoices)
    
    let step1QuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: step1title, answer: step1AnswerFormat)
    
    
    fullsteps += [step1QuestionStep]
    
    // ---------------------------------------------------------------------
    
    let ageQuestionStepTitle = "How old are you?"
    let ageAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "years")
    let ageQuestionStep = ORKQuestionStep(identifier: "AgeQuestionStep", title: ageQuestionStepTitle, answer: ageAnswerFormat)
    
    fullsteps += [ageQuestionStep]

    // ---------------------------------------------------------------------

    let heightQuestionStepTitle = "What is your height in centimetres?"
    let heightAnswerFormat = ORKNumericAnswerFormat(style: .decimal, unit: "cm")
    let heightQuestionStep = ORKQuestionStep(identifier: "HeightQuestionStep", title: heightQuestionStepTitle, answer: heightAnswerFormat)
    
    fullsteps += [heightQuestionStep]
    
    // ---------------------------------------------------------------------

    let sleepQuestionStepTitle = "What time do you usually go to sleep?"
    let sleepAnswerFormat = ORKTimeOfDayAnswerFormat()
    let sleepQuestionStep = ORKQuestionStep(identifier: "SleepQuestionStep", title: sleepQuestionStepTitle, answer: sleepAnswerFormat)
    
    fullsteps += [sleepQuestionStep]
    
    // ---------------------------------------------------------------------

    
    let diabetesQuestionStepTitle = "Do you have diabetes?"
    let diabetesAnswerFormat = ORKBooleanAnswerFormat()
    let diabetesQuestionStep = ORKQuestionStep(identifier: "DiabetesQuestionStep", title: diabetesQuestionStepTitle, answer: diabetesAnswerFormat)
    
    let diaMedQuestionStepTitle = "Do you take medications for your diabetes?"
    let diaMedAnswerFormat = ORKBooleanAnswerFormat()
    let diaMedQuestionStep = ORKQuestionStep(identifier: "DiaMedQuestionStep", title: diaMedQuestionStepTitle, answer: diaMedAnswerFormat)
    
    let diaYesQuestionStepTitle = "Please choose all medication that apply:"
    let diaMedTextChoices = [
        ORKTextChoice(text: "Insulin", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Oral hypoglycemic agents", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Diabetes pills", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let diaYesAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: diaMedTextChoices)
    let diaYesQuestionStep = ORKQuestionStep(identifier: "DiaYesQuestionStep", title: diaYesQuestionStepTitle, answer: diaYesAnswerFormat)
    
    let highBloodQuestionStepTitle = "Do you have high blood pressure?"
    let highBloodAnswerFormat = ORKBooleanAnswerFormat()
    let highBloodQuestionStep = ORKQuestionStep(identifier: "HighBloodQuestionStep", title: highBloodQuestionStepTitle, answer: highBloodAnswerFormat)
    
    let highBloodMedQuestionStepTitle = "Do you take medications for your blood pressure?"
    let highBloodMedAnswerFormat = ORKBooleanAnswerFormat()
    let highBloodMedQuestionStep = ORKQuestionStep(identifier: "HighBloodMedQuestionStep", title: highBloodMedQuestionStepTitle, answer: highBloodMedAnswerFormat)
    
    let sysQuestionStepTitle = "What is your most recent systolic blood pressure (top number)?"
    let sysAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "mm Hg")
    let sysQuestionStep = ORKQuestionStep(identifier: "SysQuestionStep", title: sysQuestionStepTitle, answer: sysAnswerFormat)
    
    let diasQuestionStepTitle = "What is your most recent diastolic blood pressure (bottom number)?"
    let diasAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "mm Hg")
    let diasQuestionStep = ORKQuestionStep(identifier: "DiasQuestionStep", title: diasQuestionStepTitle, answer: diasAnswerFormat)
    
    let smokeQuestionStepTitle = "Do you currently smoke?"
    let smokeAnswerFormat = ORKBooleanAnswerFormat()
    let smokeQuestionStep = ORKQuestionStep(identifier: "SmokeQuestionStep", title: smokeQuestionStepTitle, answer: smokeAnswerFormat)
    
    let smokeYes1QuestionStepTitle = "How many cigarettes do you smoke in a day?"
    let smokeYes1AnswerFormat = ORKNumericAnswerFormat(style: .integer)
    let smokeYes1QuestionStep = ORKQuestionStep(identifier: "SmokeYes1QuestionStep", title: smokeYes1QuestionStepTitle, answer: smokeYes1AnswerFormat)
    
    let smokeYes2QuestionStepTitle = "Have you tried quitting in the past?"
    let smokeYes2AnswerFormat = ORKBooleanAnswerFormat()
    let smokeYes2QuestionStep = ORKQuestionStep(identifier: "SmokeYes2QuestionStep", title: smokeYes2QuestionStepTitle, answer: smokeYes2AnswerFormat)
    
    let smokeYes3QuestionStepTitle = "Are you currently interested or attempting to quit smoking?"
    let smokeYes3AnswerFormat = ORKBooleanAnswerFormat()
    let smokeYes3QuestionStep = ORKQuestionStep(identifier: "SmokeYes3QuestionStep", title: smokeYes3QuestionStepTitle, answer: smokeYes3AnswerFormat)
    
    let smokeNo1QuestionStepTitle = "Have you smoked in the past?"
    let smokeNo1AnswerFormat = ORKBooleanAnswerFormat()
    let smokeNo1QuestionStep = ORKQuestionStep(identifier: "SmokeNo1QuestionStep", title: smokeNo1QuestionStepTitle, answer: smokeNo1AnswerFormat)
    
    let smokeNo2QuestionStepTitle = "How long ago did you quit smoking?"
    let smokeNo2AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "months")
    let smokeNo2QuestionStep = ORKQuestionStep(identifier: "SmokeNo2QuestionStep", title: smokeNo2QuestionStepTitle, answer: smokeNo2AnswerFormat)
    
    let alcoholQuestionStepTitle = "Do you consume alcohol?"
    let alcoholAnswerFormat = ORKBooleanAnswerFormat()
    let alcoholQuestionStep = ORKQuestionStep(identifier: "AlcoholQuestionStep", title: alcoholQuestionStepTitle, answer: alcoholAnswerFormat)
    
    let alcoholYesQuestionStepTitle = "On average, how many beverages containing alcohol do you consume in a day?"
    let alcoholYesAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "beverages")
    let alcoholYesQuestionStep = ORKQuestionStep(identifier: "AlcoholYesQuestionStep", title: alcoholYesQuestionStepTitle, answer: alcoholYesAnswerFormat)
    
    let cholQuestionTitle = "What is your most recent HDL cholesterol level?"
    let cholAnswerFormat = ORKNumericAnswerFormat(style: .decimal, unit: "mmol/L")
    let cholQuestionStep = ORKQuestionStep(identifier: "CholQuestionStep", title: cholQuestionTitle, answer: cholAnswerFormat)
    
    fullsteps += [diabetesQuestionStep,
              diaMedQuestionStep,
              diaYesQuestionStep,
              highBloodQuestionStep,
              highBloodMedQuestionStep,
              sysQuestionStep,
              diasQuestionStep,
              smokeQuestionStep,
              smokeYes1QuestionStep,
              smokeYes2QuestionStep,
              smokeYes3QuestionStep,
              smokeNo1QuestionStep,
              smokeNo2QuestionStep,
              alcoholQuestionStep,
              alcoholYesQuestionStep,
              cholQuestionStep]
    
    
    // ---------------------------------------------------------------------

   // let task = ORKOrderedTask(identifier: "ImageSurveyTask", steps: fullsteps)
    
    let task = ORKNavigableOrderedTask(identifier: "Task", steps: fullsteps)

    // Setting Rules
    
    let diabetesPredicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "DiabetesQuestionStep"), expectedAnswer: false)
    let diabetesRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(diabetesPredicate, "HighBloodQuestionStep")])
    
    task.setNavigationRule(diabetesRule, forTriggerStepIdentifier: "DiabetesQuestionStep")
    
    let diaMedPredicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "DiaMedQuestionStep"), expectedAnswer: false)
    let diaMedRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(diaMedPredicate, "HighBloodQuestionStep")])
    
    task.setNavigationRule(diaMedRule, forTriggerStepIdentifier: "DiaMedQuestionStep")
    
    let highBloodPredicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "HighBloodQuestionStep"), expectedAnswer: false)
    let highBloodRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: highBloodPredicate, destinationStepIdentifier: "SysQuestionStep")])
    
    task.setNavigationRule(highBloodRule, forTriggerStepIdentifier: "HighBloodQuestionStep")
    
    let smoke1Predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "SmokeQuestionStep"), expectedAnswer: false)
    let smoke1Rule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: smoke1Predicate, destinationStepIdentifier: "SmokeNo1QuestionStep")])
    
    task.setNavigationRule(smoke1Rule, forTriggerStepIdentifier: "SmokeQuestionStep")
    
    let smoke2Predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "SmokeNo1QuestionStep"), expectedAnswer: false)
    let smoke2Rule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: smoke2Predicate, destinationStepIdentifier: "AlcoholQuestionStep")])
    
    task.setNavigationRule(smoke2Rule, forTriggerStepIdentifier: "SmokeNo1QuestionStep")
    
    let alcoholPredicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "AlcoholQuestionStep"), expectedAnswer: false)
    let alcoholRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: alcoholPredicate, destinationStepIdentifier: "CholQuestionStep")])
    
    task.setNavigationRule(alcoholRule, forTriggerStepIdentifier: "AlcoholQuestionStep")
    
    // Summary step // ---------------------------------------------------------------------
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thank you."
    summaryStep.text = "We appreciate your time."
    
    fullsteps += [summaryStep]

    


    return task
}
