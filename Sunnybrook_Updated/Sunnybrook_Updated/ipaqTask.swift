//
//  ipaqTask.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-14.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit

public var ipaqTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instruction Step
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Short IPAQ"
    instructionStep.text = "Physical activity over the last 7 days."
    
    steps += [instructionStep]
    
    let vigorous1QuestionStepTitle = "During the last 7 days, on how many days did you do vigorous physical activities?"
    let vigorous1AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "day(s)")
    let vigorous1QuestionStep = ORKQuestionStep(identifier: "Vigorous1QuestionStep", title: vigorous1QuestionStepTitle, answer: vigorous1AnswerFormat)
    
    steps += [vigorous1QuestionStep]
    
    let vigorous2QuestionStepTitle = "How much time did you usually spend doing vigorous physical activities on one of those days?"
    let vigorous2AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "minutes")
    let vigorous2QuestionStep = ORKQuestionStep(identifier: "Vigorous2QuestionStep", title: vigorous2QuestionStepTitle, answer: vigorous2AnswerFormat)
    
    steps += [vigorous2QuestionStep]
    
    let moderate1QuestionStepTitle = "During the last 7 days, on how many days did you do moderate physical activities?"
    let moderate1AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "day(s)")
    let moderate1QuestionStep = ORKQuestionStep(identifier: "Moderate1QuestionStep", title: moderate1QuestionStepTitle, answer: moderate1AnswerFormat)
    
    steps += [moderate1QuestionStep]
    
    let moderate2QuestionStepTitle = "How much time did you usually spend doing moderate physical activities on one of those days?"
    let moderate2AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "minutes")
    let moderate2QuestionStep = ORKQuestionStep(identifier: "Moderate2QuestionStep", title: moderate2QuestionStepTitle, answer: moderate2AnswerFormat)
    
    steps += [moderate2QuestionStep]
    
    let walking1QuestionStepTitle = "During the last 7 days, on how many days did you do walk for at least 10 minutes at a time?"
    let walking1AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "day(s)")
    let walking1QuestionStep = ORKQuestionStep(identifier: "Walking1QuestionStep", title: walking1QuestionStepTitle, answer: walking1AnswerFormat)
    
    steps += [walking1QuestionStep]
    
    let walking2QuestionStepTitle = "How much time did you usually spend walking on one of those days?"
    let walking2AnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "minutes")
    let walking2QuestionStep = ORKQuestionStep(identifier: "Walking2QuestionStep", title: walking2QuestionStepTitle, answer: walking2AnswerFormat)
    
    steps += [walking2QuestionStep]
    
    let sittingQuestionStepTitle = "During the last 7 days, how much time did you usually spend sitting or laying down on a week day?"
    let sittingAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "hours")
    let sittingQuestionStep = ORKQuestionStep(identifier: "SittingQuestionStep", title: sittingQuestionStepTitle, answer: sittingAnswerFormat)
    
    steps += [sittingQuestionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thank you."
    summaryStep.text = "We appreciate your time."
    
    steps += [summaryStep]
    
    let task = ORKOrderedTask(identifier: "ipaqTask", steps: steps)
    
    return task

    
}
