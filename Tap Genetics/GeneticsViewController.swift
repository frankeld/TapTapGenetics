//
//  GeneticsViewController.swift
//  Tap Genetics
//
//  Created by David Frankel on 11/25/17.
//  Copyright © 2017 David Frankel. All rights reserved.
//

import UIKit

class GeneticsViewController: UIViewController {
    @IBOutlet weak var matchesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func matchesButtonPressed(_ sender: Any) {
        matchesButton.isHidden = true
        matchesButton.isEnabled = false
        performSegue(withIdentifier: "goToMatches", sender: self)
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
