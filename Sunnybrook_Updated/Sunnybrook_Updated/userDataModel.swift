//
//  userDataModel.swift
//  Sunnybrook_Updated
//
//  Created by Nik Pocuca on 2017-06-21.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation


public class userModel: Loopable{
    
    public var login: String
    public var pass: String
    public var id: Int
    public var consent: Int
    public var surveyScore: Int
    public var memoryScore: Int
    public var towerScore: Int
    public var tappingScore: Int
    public var names: Array<String>
    public var items: NSArray
    
    public func update(){
    items = [login,pass,id,consent,surveyScore,memoryScore,towerScore,tappingScore]
        
    }
    
    
    
    init() {
        login = "Blank";
        pass = "Blank";
        id = 0;
        consent = 0;
        surveyScore = 0;
        memoryScore = 0;
        towerScore = 0;
        tappingScore = 0;
        names = ["login","pass","id","consent","surveyScore","memoryScore","towerScore","tappingScore"]
        items = [login,pass,id,consent,surveyScore,memoryScore,towerScore,tappingScore]
        
    }
    
}


