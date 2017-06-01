//
//  DashTableViewController.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-27.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit
import ResearchKit

class DashboardTableViewController: UITableViewController, ORKPieChartViewDataSource {

    @IBOutlet weak var pieChartView: ORKPieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityCompletionPercentage = 80
        
        pieChartView.dataSource = self
        
        pieChartView.title = NSLocalizedString("Daily Activity Completion", comment: "")
        pieChartView.showsTitleAboveChart = true
        
        let dateFormatter = DateFormatter()
        
        pieChartView.text  = dateFormatter.string(from: NSDate() as Date)
    }
    
    
    // MARK: Pie chart data source
    func numberOfSegmentsInPieChartView(pieChartView: ORKPieChartView) -> Int {
        return 2
    }
    
    enum PieChartSegment: Int {
        case Completed, Remaining
    }
    
    var activityCompletionPercentage: CGFloat = 0
    
    func pieChartView(_ pieChartView: ORKPieChartView, valueForSegmentAt index: Int) -> CGFloat {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return activityCompletionPercentage
        case .Remaining:
            return 100 - activityCompletionPercentage
        }
    }
    
    func pieChartView(pieChartView: ORKPieChartView, colorForSegmentAtIndex index: Int) -> UIColor {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return UIColor.blue
        case .Remaining:
            return UIColor.green
        }
    }
    
    func pieChartView(pieChartView: ORKPieChartView, titleForSegmentAtIndex index: Int) -> String {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return NSLocalizedString("Completed", comment: "")
        case .Remaining:
            return NSLocalizedString("Remaining", comment: "")
        }
    }
}
