//
//  MatchViewController.swift
//  Tap Genetics
//
//  Created by David Frankel on 11/26/17.
//  Copyright © 2017 David Frankel. All rights reserved.
//

import UIKit
import SVProgressHUD

class MatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            SVProgressHUD.showInfo(withStatus: "Come back tomorrow for more matches!")
        }
        
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
