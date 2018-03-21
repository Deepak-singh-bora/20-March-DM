//
//  APIController.swift
//  20 March DM
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

class APIController{
    
    func getAPI(parameters: [[String:Any]], onModelSuccess: @escaping (DataModel)->Void,onFailure: @escaping (Error)->Void){
//        let headers = [
//            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
//            "Cache-Control": "no-cache",
//            "Postman-Token": "226211b8-dc9b-4867-9b09-d291155c7cb3"
//        ]
        var url = "https://httpbin.org/get?"
        https://httpbin.org/get?ID=12345&Name=Deepak
        
        for array in parameters{
            for (key,val) in array as [String:Any]{
                url = url + key + "=" + (val as! String) + "&"
            }
        }
        if url.last == "&"{
            url.removeLast()
        }
        NetworkController().getJson(URL: url, success: { (data) in
            let arguments = data["args"]! as! [String:String]
            let userDetails = DataModel(ID: arguments["ID"]!, name: arguments["Name"]!,city: "Haldwani")
            onModelSuccess(userDetails)
        }) { (err) in
            onFailure(err)
        }
    }
    
    func postAPI(parameters: [[String:Any]], onModelSuccess: @escaping (DataModel)->Void,onFailure: @escaping (Error)->Void)
    {
        let url = "https://httpbin.org/post"
        let headers = [
        "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
        "Cache-Control": "no-cache",
        "Postman-Token": "d3cb9ecd-8857-403c-9cbf-d8a8dd056219"
        ]
        
        var updatedParameters=""
        for array in parameters{
            for (key,val) in array as [String:Any]{
                updatedParameters = updatedParameters + key + "=" + (val as! String) + "&"
            }
        }
        
        if updatedParameters.last == "&"{
            updatedParameters.removeLast()
        }
        
        //let parameters = [["name": "XYZ","value": "78958"],["name": "Deepak","value": "Ai415"]]
//        NetworkController().postAPI(URL: url, headers: headers, parameters: updatedParameters) { (jsondata) in
//            //let obj = jsondata["json"]! as! ([NSDictionary])
////            for array in obj as! [String:String]
////            {
////                for (key,val) in array
////                {
////                    print(val)
////                }
////            }
//            //let tuple = ({ Name = Deepak; },{ ID = 001; },{ City = Haldwani; })
//            //print(tuple!)
//            //print(jsondata["json"]!)
//            //let (id,name,city) = jsondata["json"]!
//            //if let resultsArray = jsondata["json"]! as?  {
////                if let dict = resultsArray[0] as? NSDictionary {
////                    print(dict["address"])
////                }
////                let name = (resultsArray[0]) as! [String:String]
////               // print(name["Name"]!)
////                let id = resultsArray[1] as! [String:String]
////                let city = resultsArray[2] as! [String:String]
//
//
//
//
//                //print("your city is \(city["City"]!)")
//                //let objOfUserModel = DataModel(ID: id["ID"], name: name["Name"]!,city: city["City"]!)
//
////            var namee="",cityy="",idd="";
////            let data = jsondata["form"] as! [[String:String]]
////            for myArray in data{
////                if myArray["Name"] != nil{
////                    namee = myArray["Name"]!
////                }
////                    if myArray["City"] != nil{
////                        cityy = myArray["City"]!
////                }
////                        if myArray["ID"] != nil{
////                            idd = myArray["ID"]!
////                }
////            }
////
//
//            //print(jsondata)
//            let arguments = jsondata["form"]! as! [String:String]
//            let userDetails = DataModel(ID: arguments["ID"]!, name: arguments["Name"]!,city: "Haldwani")
//            onModelSuccess(userDetails)
////                let objOfUserModel = DataModel(ID: idd, name: namee,city: cityy)
////                onModelSuccess(objOfUserModel)
//
//        }
        
        NetworkController().postAPI(URL: url, headers: headers, parameters: updatedParameters, success: { (jsondata) in
            let arguments = jsondata["form"]! as! [String:String]
            let userDetails = DataModel(ID: arguments["ID"]!, name: arguments["Name"]!,city: "Haldwani")
            onModelSuccess(userDetails)
        }) { (err) in
            onFailure(err)
        }
    }
}
