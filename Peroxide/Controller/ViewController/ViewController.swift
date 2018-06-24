//
//  ViewController.swift
//  MVCPracticeCode


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (Reachability.isConnectedToNetwork()){
            self.methodPrefectCall()
        }else{
           ModelController.showAlert(kAppName, andMessage: kNetworkError, withController: self)
        }
    }
    func methodPrefectCall(){
        
        ServiceManager.methodGETServerRequest(kBaseUrl, andParameters:[:], success: { response in
            if response is NSDictionary{
                print("response-----%@",response?.description)
            }else{
                /*
                self.arrayPrefectCallData = response as! [AnyObject]
                print("arrayPrefectCallData-----%@",self.arrayPrefectCallData.description)
                */
            }
        }) { error in
            /*
            print("error-----%@",error?.localizedDescription)
            */
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

