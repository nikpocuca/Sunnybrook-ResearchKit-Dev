//
//  Dash_v2ViewController.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-27.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit

public class Dash_v2: UIViewController, ORKPieChartViewDataSource {
    
 
    
  
    @IBAction func update(_ sender: Any) {
        
        get()
    }
    
    
    // survey button
    @IBOutlet weak var survey_b: UIButton!
    
    
    // pieChart view
    @IBOutlet weak var pieChartView: ORKPieChartView!
    
    // initializing number of segments
    public func numberOfSegments(in pieChartView: ORKPieChartView) -> Int {
        return 2;
    }

    //declaring a dataCounter as a datasource class
    public var dataCounter = DataSource()
    
    
    // activity percent parsed in through dataCounter.
    public var activityPercent: CGFloat {
        get {
            return dataCounter.perCent
        }
    }
    
    
    // everytime it appears the pieChart is updated with the data from the tabbed view controller.
    override public func viewDidAppear(_ animated: Bool) {
        
        pieChartView.reloadData()
    }
    
    
    // initialization of view controller.
    override public func viewDidLoad() {
        super.viewDidLoad()

        
        // pass in SunnybrookTab data
        let tbvc = self.tabBarController as! SunnybrookTabBarController
        dataCounter = tbvc.dataCounter
        
        
        
        // format pieChartViews.
        //pieChartView.title = NSLocalizedString("MiTy Kids Progress", comment:"")
        pieChartView.titleColor = UIColor.blue
       // pieChartView.showsTitleAboveChart = true
        //declare datasource for pieChart.
        pieChartView.dataSource = self

    }
   

    
    
    
    // an action
    @IBAction func survey_tapped(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
        

    }
   

    
 

    
    
    
    
    // MARK: Pie chart data source
    // Below is all formatting and pieChart functions that are passed in. 
    
    func numberOfSegmentsInPieChartView(pieChartView: ORKPieChartView) -> Int {
        return 2
    }
    
    // enumeration of two segments.
    enum PieChartSegment: Int {
        case Completed, Remaining
    }

    
    // hospital color.
     let bord_c : UIColor = UIColor.init(red: 0, green: 119, blue: 250, alpha: 1)
    
    
    // Segment Values, refer to activity Percent.
    public func pieChartView(_ pieChartView: ORKPieChartView, valueForSegmentAt index: Int) -> CGFloat {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return activityPercent
        case .Remaining:
            return 100 - activityPercent
        }
    }
    
    
    // Segment Colours.
    public func pieChartView(_ pieChartView: ORKPieChartView, colorForSegmentAt index: Int) -> UIColor {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return UIColor.orange
        case .Remaining:
            return UIColor.gray
        }
    }
    
    
    // title for segments, completed, remaining, two cases.
   public func pieChartView(_ pieChartView: ORKPieChartView, titleForSegmentAt index: Int) -> String {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return NSLocalizedString("Completed", comment: "")
        case .Remaining:
            return NSLocalizedString("Remaining", comment: "")
        }
    }
    
  
    
    
}



// extension of view controller.
extension Dash_v2 : ORKTaskViewControllerDelegate {
    
    public func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
