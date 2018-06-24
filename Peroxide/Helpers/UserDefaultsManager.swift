//
//  UserDefaultsManager.swift


import UIKit

class UserDefaultsManager: NSObject {

//Method for save Object in NSUserDefaults
    class func methodForSaveStringObjectValue(_ stringObjectName: String, andKey stringKey: String){
            UserDefaults.standard.setValue(stringObjectName, forKey:stringKey)
    }
   
//Method for fetch Object from NSUserDefaults
    class func methodForFetchStringObjectValue(_ stringKey: String)->String{
      let stringFetchResult = UserDefaults.standard.object(forKey: stringKey) as! String
      return stringFetchResult
    }

//Method for save Boolean in NSUserDefaults
    class func methodForSaveBooleanValue(_ booleanValue: Bool, andKey stringKey: String) {
        UserDefaults.standard.set(booleanValue, forKey:stringKey)
    }
    
//Method for fetch Boolean from NSUserDefaults
    class func methodForFetchBooleanValue(_ stringKey: String)-> Bool {
       
        var isBoolValue = Bool()
        if UserDefaults.standard.bool(forKey: stringKey) {
            isBoolValue = true
        }else{
            isBoolValue = false
        }
        return isBoolValue
    }
    
//Method for remove Object from NSUserDefaults
    class func methodForRemoveObjectValue(_ stringKey: String){
        UserDefaults.standard.removeObject(forKey: stringKey)
    }
    
    class func isValueInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
