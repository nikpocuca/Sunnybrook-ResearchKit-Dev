//
//  TOHTask.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-14.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit


public var TOHTask: ORKOrderedTask {
    

    
    let task = ORKOrderedTask.towerOfHanoiTask(withIdentifier: "TOHTask",
                                               intendedUseDescription: "The goal of the puzzle is to move all the disks from the leftmost peg to the rightmost peg, adhering to the following rules: Move only one disk at a time. A larger disk may not be placed ontop of a smaller disk.All disks, except the one being moved, must be on a peg." ,
                                    numberOfDisks: 3,
                                    options: ORKPredefinedTaskOption())
    
    return task
}




