//
//  DataSource.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-30.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit
import UIKit

public class DataSource: NSObject {
    /**
     Asks the data source for the number of segments in the pie chart view.
     
     @param pieChartView     The pie chart view asking for the number of segments.
     
     @return The number of segments in the pie chart view.
     
     */
   
    

    
 public var perCent: CGFloat
    public var Score: Int
    
   override init() {
    perCent = 0;
    Score = 0 ;
    }
    
       
    
}
