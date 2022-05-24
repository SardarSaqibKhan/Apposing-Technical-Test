//
//  NetworkRequests.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 21/05/2022.
//

import Foundation

class NetworkRequests {
    
    

    func retrieveSuggestedSkills(_ completion: @escaping([Skills]?, Error?) -> Void)  {
        
        // creating url from endpoint string
        let retrieveSkills_url = URL(string:URLs.retrieveSkills.rawValue)!
        
        // creating session object
        let session = URLSession.shared
        
        //create dataTask using the session object to retrieve data to the server
        let task = session.dataTask(with: retrieveSkills_url, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
                
            }
            guard let data = data else { return }
            do{
                let suggestesSkills = try JSONDecoder().decode([Skills].self, from: data)
                DispatchQueue.main.async {
                    completion(suggestesSkills,nil)
                }
            }
            catch(let decodingError){
                DispatchQueue.main.async {
                    completion(nil,decodingError)
                }
            }
           
        })
        task.resume()
        
   
       
    }
    
   
   
    func retrieveSkills(_ completion: @escaping([Skills]?, Error?) -> Void)  {
        
        // creating url from endpoint string
        let retrieveSkills_url = URL(string:URLs.addSkills.rawValue)!
        
        // creating session object
        let session = URLSession.shared
        
        //create dataTask using the session object to retrieve data to the server
        let task = session.dataTask(with: retrieveSkills_url, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
                
            }
            guard let data = data else { return }
            do{
                let suggestesSkills = try JSONDecoder().decode([Skills].self, from: data)
                DispatchQueue.main.async {
                    completion(suggestesSkills,nil)
                }
            }
            catch(let decodingError){
                DispatchQueue.main.async {
                    completion(nil,decodingError)
                }
            }
           
        })
        task.resume()
        
   
       
    }
}

