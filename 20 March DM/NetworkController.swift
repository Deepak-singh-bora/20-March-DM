//
//  NetworkController.swift
//  20 March DM
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

class NetworkController{
    
    func getJson(URL: String, headers: [String:Any]? = [String:Any](),success: @escaping ([String:Any])->Void,onNetworkFailure: @escaping (Error)->Void){
        
        let request = NSMutableURLRequest(url: NSURL(string: URL)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers! as? [String:String]
        //request.httpBody = postData as Data
    //print(URL)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            }
            do{
                guard let JsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                else{
                    print("\nIn else\n")
                    onNetworkFailure(error!)
                    return
                }
                success(JsonData)
            }catch{
                //print(error)
                print("\nError on the link \n")
                onNetworkFailure(error)
            }

            
        })
        dataTask.resume()
    }
    
//    func postJson(headers: [String:Any],parameters: [[String:Any]])
//    {
//        let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
//        var body = ""
//        let error: NSError? = nil
//        for param in parameters {
//            let paramName = param["name"]!
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition:form-data; name=\"\(paramName)\""
//            if let filename = param["fileName"] {
//                let contentType = param["content-type"]!
//                let fileContent = try! String(contentsOfFile: filename as! String, encoding: String.Encoding.utf8)
//                if (error != nil) {
//                    print(error!)
//                }
//                body += "; filename=\"\(filename)\"\r\n"
//                body += "Content-Type: \(contentType)\r\n\r\n"
//                body += fileContent
//            } else if let paramValue = param["value"] {
//                body += "\r\n\r\n\(paramValue)"
//            }
//        }
//        let parameters1 = [
//            [
//                "name": "iddd",
//                "value": "78958"
//            ],
//            [
//                "name": "Deepak",
//                "value": "1234"
//            ]
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://httpbin.org/post")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers as? [String : String]
////        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
////        request.addValue("application/json", forHTTPHeaderField: "Accept")
//       // let postString = "Name: DEepak Bora"
//        //request.httpBody = postString.data(using: String.Encoding.utf8);
//
//        //request.httpBody = postString.data(using: .utf8)
//        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters1, options: [])
//        //request.httpBody = (postData as NSString).data(using: String.Encoding.utf8.rawValue)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error!)
//            }
//
//            do{
//                let jsonPost = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
//                print(jsonPost)
//            }catch{
//                print(error)
//            }
//        })
//        dataTask.resume()
//    }
    
    
    func postAPI(URL: String,headers: [String:Any],parameters: String,success: @escaping ([String:Any])->Void,onFailure: @escaping (Error)->Void)
    {
        
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: NSURL(string: URL)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST" //set http method as
        let postString = parameters
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            guard let allData = data
                else
            {
                return
            }
            do
            {
                if let json = try! JSONSerialization.jsonObject(with: allData, options: .mutableContainers) as? [String : Any]
                {
                    //print(json)
                    success(json)
                }
            }
        })
        
        dataTask.resume()
    }
}
