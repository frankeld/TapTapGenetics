//
//  ViewController.swift
//  Tap Genetics
//
//  Created by David Frankel on 11/25/17.
//  Copyright © 2017 David Frankel. All rights reserved.
//

import UIKit
import SwiftyGif
import LocalAuthentication
import SVProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var thumbprintButton: UIButton!
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var thumbprintImage: UIImageView!
    let gifManager = SwiftyGifManager(memoryLimit:100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gifImage = UIImage(gifName: "giphy.gif")
        thumbprintImage.setGifImage(gifImage, manager: gifManager, loopCount: 0)

    }
    
    
    @IBAction func thumbprintPressed(_ sender: Any) {
        thumbprintButton.isEnabled = false
        let myContext = LAContext()
        let myLocalizedReasonString = "By using your thumbprint, we can access our genetic database. You will be one step closer to finding the perfect match!"
        directionsLabel.text = " "
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    if success {
                        // User authenticated successfully, take appropriate action
                        //SVProgressHUD.showSuccess(withStatus: "Image recieved. Processing...")
                        let gifImage = UIImage(gifName: "giphy.gif")
                        self.thumbprintImage.setGifImage(gifImage, manager: self.gifManager, loopCount: -1)
                        let delay: Double = Double(arc4random_uniform(20))/2 + 4
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
                            SVProgressHUD.dismiss()
                            self.performSegue(withIdentifier: "goToGenetics", sender: self.thumbprintButton)
                        }
                    } else {
                        // User did not authenticate successfully, look at error and take appropriate action
                        SVProgressHUD.showError(withStatus: "We are having trouble with your thumbprint. Try again.")
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
            }
        } else {
            // Fallback on earlier versions
        }
        thumbprintButton.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

