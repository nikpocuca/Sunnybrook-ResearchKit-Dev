//
//  parse.swift
//  
//
//  Created by Nik Pocuca on 2017-06-04.
//
//

import Foundation

public func Parse(input: Array<String>) -> Array<Int> {
    var output: Array<Int> = []
    
    for entry in input {
        let left = entry.replacingOccurrences(of: "[", with: "", options: .literal, range: nil)
        let right = left.replacingOccurrences(of: "]", with: "", options: .literal, range: nil)
        let middle = Int(right)
        output += [middle!]
        
    }
    
    
    print(output)
    
    return output;
}



public func Scorer(input: Array<Int>, Method: Array<Array<Int>>) -> Int{
    var ans: Int = 0
    var count: Int = 0
    
    for entry in input{
        
        let score = Method[count][entry]
        
        ans = ans + score
        count += 1
    }
    return ans
}
