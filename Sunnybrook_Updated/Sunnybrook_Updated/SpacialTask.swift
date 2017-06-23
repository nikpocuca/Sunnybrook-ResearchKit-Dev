//
//  WalkingTask.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-14.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit

public var SpacialTask: ORKOrderedTask {

    
    let task =  ORKOrderedTask.spatialSpanMemoryTask(withIdentifier: "SpacialTask",
                                                     intendedUseDescription: "Please attempt to follow the instructions correctly",
                                                     initialSpan: 2, minimumSpan: 2,
                                                     maximumSpan: 5, playSpeed: 1,
                                                     maximumTests: 3, maximumConsecutiveFailures: 5,
                                                     customTargetImage: #imageLiteral(resourceName: "rhombus"), customTargetPluralName: "Test",
                                                     requireReversal: false, options: ORKPredefinedTaskOption())
    return task

}

