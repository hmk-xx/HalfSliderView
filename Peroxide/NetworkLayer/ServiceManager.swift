//
//  ServiceManager.swift


import UIKit
import Alamofire

class ServiceManager: NSObject {
    
    
    //Method for Get request
    //https://github.com/Alamofire/Alamofire
    class func methodGETServerRequest(_ queryString: String, andParameters payload: [String: AnyObject], success: @escaping (_ response: AnyObject?) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        
        let formattedSearchString = queryString.replacingOccurrences(of: " ", with:"")
        let urlString = String(format:"%@",formattedSearchString)
        print("urlString-----",urlString)
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                    
                case .success:
                    print(response)
                    print(response.timeline)
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options: []) as? AnyObject{
                            success(jsonResult )
                        }
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    failure(error as NSError?)
                }
        }
    }
    
    //Method for POST request
    class func POSTServerRequest(_ queryString: String,andParameters payload: [String: String], success: @escaping (_ response: AnyObject?) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        let formattedSearchString = queryString.replacingOccurrences(of: " ", with:"")
        let urlString = String(format:"%@", formattedSearchString)
        let parameters = payload
        
        print("urlString-----",urlString)
        print("parameters-----",parameters)
        
        Alamofire.request(queryString, method:.post, parameters:parameters, headers:nil)
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                    
                case .success:
                    print(response)
                    print(response.timeline)
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options: []) as? AnyObject{
                            success(jsonResult )
                        }
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    failure(error as NSError?)
                }
        }
    }
}

