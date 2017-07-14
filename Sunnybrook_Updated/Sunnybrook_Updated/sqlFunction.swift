import Foundation

import Foundation
import UIKit




// post function
// =======================================================================================================//
public func sqlFunction(id: Int, Name: String, score: Int) {
    
    // POST REQUEST Only, see php file for web service.
    let loci = "http://142.76.15.107/"
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





// post function
// =======================================================================================================//
public func sqlAccount(login: String, pass: String, model: userModel) -> userModel{
    
    // POST REQUEST Only, see php file for web service.
    let loci = "http://142.76.15.107/"
    let appended =  loci + "account.php"
    
    var request = URLRequest(url: URL(string: appended)!)
    request.httpMethod = "POST"
    let postString = "login=\(login)&pass=\(pass)"
    request.httpBody = postString.data(using: .utf8)!
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let reponse = response {
            print(reponse)
        }
        if let data = data {
            //print(data)
            
            do{
                var accountJson: NSDictionary!
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                accountJson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                //print(json)
                
                //getting the json array account from the response 
                
                //initialize array for parsing
                let account: NSArray = accountJson["account"] as! NSArray;
                let first = account[0] as! NSDictionary
                
                
                //parse into strings from json
                let login: String = first["login"] as! String
                let id: String = first["id"] as! String
                let consent: String = first["consent"] as! String
                let memoryScore: String = first["memoryScore"] as! String
                let surveyScore: String = first["surveyScore"] as! String
                let tappingScore: String = first["tappingScore"] as! String
                let towerScore: String = first["towerScore"] as! String
                
              //  print("Model before")
             //   print(model.id)
                
                //attach to datamodel.
                model.login = login
                model.id = Int(id)!
                model.consent = Int(consent)!
                model.memoryScore = Int(memoryScore)!
                model.surveyScore = Int(surveyScore)!
                model.tappingScore = Int(tappingScore)!
                model.towerScore = Int(towerScore)!
                
               // model.id = 25
                
              //  print("Model After")
               // print(model.id)
                
             //   print("\(login) + --- + \(memoryScore)")
                
                
                
                
                
            } catch {
                print(error)
            }
            
            
            
            
        }

    }
    task.resume()
    
    return model
}







// =======================================================================================================//
// Query Function allows for both select, insert and etc. A direct communication to the server via sql.
public func sqlQuery(qOutlet: UITextView!){
    
    let loci = "http://142.76.15.107/"
    let appended = loci + "test.php"
    let qString = qOutlet.text!
    
    
    
    var request = URLRequest(url: URL(string: appended)!)
    request.httpMethod = "POST"
    
    let postString = "sql=\(qString)"
    request.httpBody = postString.data(using: .utf8)!
    
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let reponse = response {
            print(reponse)
        }
        if let data = data {
            //print(data)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
           // qOutlet.text = json as! String
            
                
            } catch {
                print(error)
            }
            
            
            
            
        }
    
    
    }
    task.resume()
    
}

//Updateing the database for sql
public func sqlUpdate(model: userModel) -> userModel {
    
    //initialize location.
    let loci = "http://142.76.15.107/"
    // I need to create my own php for update.
    let appended = loci + "update.php"

    
    var request = URLRequest(url: URL(string: appended)!)
    request.httpMethod = "POST"
    
    
    
    //generate string by concatting multiple entries from the array.
    var sqlString  = ""
    for name in model.names{
        sqlString = sqlString + name + "="
        let index = model.names.index(of: name)!
        let item = model.items[index]
        sqlString = sqlString + "\(item)"
        let end = model.names.count - 1
        if index != end {
            sqlString = sqlString + "&"
        }
    
    }
    print(sqlString)
    
    //send into post
    let postString = sqlString
    request.httpBody = postString.data(using: .utf8)!
    
    
    // send post request updating the account scores, etc.
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
    
    
   //generate Account (calls the account sql)
   let model = sqlAccount(login: model.login, pass: model.pass, model: model)
    
    
    
    return model
}


















public func get() {
    let loci = "http://142.76.15.107/"
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
