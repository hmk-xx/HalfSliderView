//
//  UserSliderViewController.swift
//  Peroxide
//
//  Created by mac on 21/03/17.
//  Copyright © 2017 Croma. All rights reserved.
//

import UIKit

class UserSliderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var tableView:UITableView? = UITableView()
    @IBOutlet var imageViewProfile:UIImageView? = UIImageView()
    var arrayOptionsData = [String]()
    var arrayViewControllerIdentifiers = [String]()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Array all option names
        arrayOptionsData.append(NSLocalizedString("AppSettings", comment: ""))
        arrayOptionsData.append(NSLocalizedString("ConfigureKit", comment: ""))
        arrayOptionsData.append(NSLocalizedString("Record", comment: ""))
        arrayOptionsData.append(NSLocalizedString("Order", comment: ""))
        //arrayOptionsData.append("Sign Out")
        
        //Array for all viewcontrollers related to Half slider
        arrayViewControllerIdentifiers.append("UserDashboardViewController")
        arrayViewControllerIdentifiers.append("ConfigureKitViewController")
        arrayViewControllerIdentifiers.append("RecordViewController")
        arrayViewControllerIdentifiers.append("OrderViewController")
       // arrayViewControllerIdentifiers.append("LogOutViewController")
        
        //Code for Notifiaction Observer
        NotificationCenter.default.addObserver(self, selector: #selector(self.notify), name: NSNotification.Name(rawValue: kRemoveFromSuperView), object: nil)
        
        //Code for register UITableView with identifier
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        /*
         //Code left swipe gesture
         let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
         swipeLeft.direction = .left
         self.view.addGestureRecognizer(swipeLeft)
         */
        super.viewWillAppear(true)
    }
    //Method for swipe gesture
    func handleSwipe(_ swipe: UISwipeGestureRecognizer) {
        if swipe.direction == .left {
            NotificationCenter.default.post(name: Notification.Name(rawValue: kRemoveFromSuperView), object: nil)
        }
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: kRemoveFromSuperView), object: nil)
        
        self.navigationController!.navigationBar.isHidden = true
    }
    // Method for Swipe Animation.
    @objc func notify(_ not: Notification) {
        UIView.beginAnimations(nil, context: nil)
        UIView.animate(withDuration: 0.50, animations: {()-> Void in
            self.view.frame = CGRect(x: -(self.view.bounds.size.width), y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
            
        }, completion: { (finished: Bool) -> Void in
            
        })
        UIView.commitAnimations()
    }
    @objc func methodUserSettings(sender: UIButton!) {
        let appDelegate =       UIApplication.shared.delegate as! AppDelegate
        /*
        let objUserProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController
        let navigationController = UINavigationController(rootViewController: objUserProfileViewController!)
        appDelegate.objRevealViewController.pushFrontViewController(navigationController, animated: true)
        */
    }
    //#MARK: tableview delegate/datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayOptionsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: kSliderTableViewCell)!) as! SliderTableViewCell
            cell.lableOptionName?.text = arrayOptionsData[(indexPath as NSIndexPath).row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: kRemoveFromSuperView), object: nil)
        
        let stringViewControllerIdentifier = self.arrayViewControllerIdentifiers[(indexPath as NSIndexPath).row]
        
        let appDelegate =       UIApplication.shared.delegate as! AppDelegate
            appDelegate.objRevealViewController.setFrontViewPosition(FrontViewPosition.left, animated: true)
        
        if (stringViewControllerIdentifier == "UserDashboardViewController") {
            let objUserDashboardViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDashboardViewController") as? UserDashboardViewController
            let navigationController = UINavigationController(rootViewController: objUserDashboardViewController!)
            appDelegate.objRevealViewController.pushFrontViewController(navigationController, animated: true)
            
        } else if (stringViewControllerIdentifier == "ConfigureKitViewController") {
            let objConfigureKitViewController = self.storyboard?.instantiateViewController(withIdentifier: stringViewControllerIdentifier) as? ConfigureKitViewController
            let navigationController = UINavigationController(rootViewController: objConfigureKitViewController!)
            appDelegate.objRevealViewController.pushFrontViewController(navigationController, animated: true)
            
        }else if (stringViewControllerIdentifier == "RecordViewController") {
            let objRecordViewController = self.storyboard?.instantiateViewController(withIdentifier: stringViewControllerIdentifier) as? RecordViewController
            let navigationController = UINavigationController(rootViewController: objRecordViewController!)
            appDelegate.objRevealViewController.pushFrontViewController(navigationController, animated: true)
            
        }else if (stringViewControllerIdentifier == "UserNotificationSettingViewController") {
            let objOrderViewControllerr = self.storyboard?.instantiateViewController(withIdentifier: stringViewControllerIdentifier) as? OrderViewController
            let navigationController = UINavigationController(rootViewController: objOrderViewControllerr!)
            appDelegate.objRevealViewController.pushFrontViewController(navigationController, animated: true)
            
        }/*else{
            
            UserDefaultsManager.methodForRemoveObjectValue(kIsLoggedIn)
            UserDefaultsManager.methodForRemoveObjectValue("UserType")
            
            appDelegate.methodForLogout()
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
