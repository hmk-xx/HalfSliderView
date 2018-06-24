//
//  RecordViewController.swift
//  Peroxide
//
//  Created by Harish on 02/06/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeNavigationBarWithSlideButton()
        self.methodNavigationBarBackGroundAndTitleColor(NSLocalizedString("Record", comment: ""))
        if revealViewController() != nil {
            
            revealViewController().rightViewRevealWidth = 50
            // Example sidebar is width 200
            revealViewController().rearViewRevealWidth = 300;
            // Cannot drag and see beyond width 200
            revealViewController().rearViewRevealOverdraw = 0.0;
            // Faster slide animation
            revealViewController().toggleAnimationDuration = 0.0;
            // Simply ease out. No Spring animation.
            revealViewController().toggleAnimationType = SWRevealToggleAnimationType.easeOut
            // More shadow
            revealViewController().frontViewShadowRadius = 15;
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        // Do any additional setup after loading the view.
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
