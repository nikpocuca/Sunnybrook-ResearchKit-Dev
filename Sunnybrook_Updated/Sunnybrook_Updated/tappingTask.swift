//
//  tappingTask.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-14.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit

public var TappingTask: ORKOrderedTask {
    
    return ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: "Please hit the two points as fast you can.", duration: 20, handOptions:ORKPredefinedTaskHandOption(), options: ORKPredefinedTaskOption())


}
