import Foundation

import Foundation
import UIKit





public func sqlFunction(id: Int, Name: String, score: Int) {
    
    
    // POST REQUEST Only, see php file for web service.
    
    let loci = "http://142.76.191.73:8888/"
    let appended =  loci + "talk.php"
    
    
    var request = URLRequest(url: URL(string: appended)!)
    
    
    request.httpMethod = "POST"
    
    
    
    let postString = "id=\(id)&Name=\(Name)&score=\(score)"
    request.httpBody = postString.data(using: .utf8)!
    
    
    
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {                                                 // check for fundamental networking error
            print("error=\(error)")
            return
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            print("response = \(response)")
        }
        
        let responseString = String(data: data, encoding: .utf8)
        print("responseString = \(responseString)")
    }
    task.resume()
}







public func get() {
    
    let loci = "http://142.76.191.73:8888/"
    let appended =  loci + "service.php"
    
    
    
    guard let url = URL(string: appended) else {return }
    
    let session = URLSession.shared
    
    session.dataTask(with: url) { (data, response, error) in
        if let reponse = response {
            print(reponse)
        }
        if let data = data {
            //print(data)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
                
                
                
                
            } catch {
                print(error)
            }
            
            
            
            
        }
        
        
        
        }.resume()

}
