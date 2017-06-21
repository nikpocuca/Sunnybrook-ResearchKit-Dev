//
//  Consent_Document.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-12.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    let consentDocument = ORKConsentDocument()
    
    //TODO: Consent Sections
    let consentSectionTypes: [ORKConsentSectionType] = [
    
    .overview
    .dataGathering,
    .Privacy,
    .DataUse,
    .TimeCommitment,
    .StudySurvey,
    .StudyTasks,
    .Withdrawing
    ]
    //Signature
    
    
    return consentDocument
}
