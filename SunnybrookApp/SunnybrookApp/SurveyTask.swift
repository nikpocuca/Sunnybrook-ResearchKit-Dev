//
//  SurveyTask.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-26.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit


public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    

    
    
    //TODO: add instructions step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "MiTy Kids Nutrition Screening"
    instructionStep.text = "You will be asked questions about your toddler's (18-35 months old) eating and other habits"
    steps += [instructionStep]
    
    //TODO: add grains
    let grainQuestionStepTitle = "My child usually eats grain products:"
    let graintextChoices = [
        ORKTextChoice(text: "More than 5 times a day", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "4 to 5 times a day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "2 to 3 times a day", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Less than 2 times a day", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let grainAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: graintextChoices)
    let grainQuestionStep = ORKQuestionStep(identifier: "grainTextChoiceQuestionStep", title: grainQuestionStepTitle, answer: grainAnswerFormat)
    
    
    steps += [grainQuestionStep]
    
    
    //TODO: add milk
    let milkQuestionStepTitle = "My child usually has milk products:"
    let milktextChoices = [
        ORKTextChoice(text: "More than 3 times a day", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "3 times a day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "2 times a day", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Once a day or less", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
        
    ]
    let milkAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: milktextChoices)
    let milkQuestionStep = ORKQuestionStep(identifier: "milkChoiceQuestionStep", title: milkQuestionStepTitle, answer: milkAnswerFormat)
    steps += [milkQuestionStep]
    
    

    //TODO: add vegtables and fruit
    
    
    //TODO: add milk
    let vegQuestionStepTitle = "My child usually eats vegetables and fruit:"
    let vegtextChoices = [
        ORKTextChoice(text: "More than 4 times a day", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "3 to 4 times a day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "2 times a day", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Once a day", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Not at all", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let vegAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: vegtextChoices)
    let vegQuestionStep = ORKQuestionStep(identifier: "vegChoiceQuestionStep", title: vegQuestionStepTitle, answer: vegAnswerFormat)
    steps += [vegQuestionStep]
    
    
    
    
    
    
    //TODO: add meat products. 
    
    
    
    let meatQuestionStepTitle = "My child usually eats meat, fish, poultry, or alternatives:"
    let meattextChoices = [
        ORKTextChoice(text: "More than 2 times a day", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "2 times a day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Once a day", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "A few times a week", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Not at all", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let meatAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: meattextChoices)
    let meatQuestionStep = ORKQuestionStep(identifier: "meatChoiceQuestionStep", title: meatQuestionStepTitle, answer: meatAnswerFormat)
    steps += [meatQuestionStep]
    
    
    
    
    
    
    

    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
