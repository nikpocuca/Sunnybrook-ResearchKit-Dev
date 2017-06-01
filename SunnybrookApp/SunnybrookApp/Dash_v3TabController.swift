//
//  Dash_b3TabController.swift
//  SunnybrookApp
//
//  Created by Nik Pocuca on 2017-05-30.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit

class Dash_v3: UITabBarController, ORKPieChartViewDataSource {
    
    
    @IBOutlet weak var survey_b: UIButton!
    
    @IBOutlet weak var pieChartView: ORKPieChartView!
    public func numberOfSegments(in pieChartView: ORKPieChartView) -> Int {
        return 2;
    }
    
    
    @IBAction func update(_ sender: Any) {
        
        activityCompletionPercentage = 100
        pieChartView.dataSource = self
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChartView.dataSource = self
        
        
        
        let bord_c : UIColor = UIColor.init(red: 0, green: 119, blue: 250, alpha: 1)
        
        survey_b.layer.cornerRadius = 4
        survey_b.layer.borderWidth = 2
        survey_b.layer.borderColor = bord_c.cgColor;
        
        
    }
    
    
    @IBAction func survey_tapped(_ sender: Any) {
        
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
        
        
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
    
    func pieChartView(_ pieChartView: ORKPieChartView, colorForSegmentAt index: Int) -> UIColor {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return UIColor.blue
        case .Remaining:
            return UIColor.gray
        }
    }
    
    func pieChartView(_ pieChartView: ORKPieChartView, titleForSegmentAt index: Int) -> String {
        switch PieChartSegment(rawValue: index)! {
        case .Completed:
            return NSLocalizedString("Completed", comment: "")
        case .Remaining:
            return NSLocalizedString("Remaining", comment: "")
        }
    }
}

extension Dash_v2 : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
