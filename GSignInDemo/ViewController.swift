//
//  ViewController.swift
//  GSignInDemo
//
//  Created by Rajesh Karmaker on 24/3/18.
//  Copyright © 2018 Rajesh Karmaker. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    func refreshUI(user: GIDGoogleUser?) {
        
        nameLabel.text = (user?.profile.givenName)! + " " + (user?.profile.familyName)!
        emailLabel.text = user?.profile.email
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        // Do any additional setup after loading the view, typically from a nib.
        let signInButton = GIDSignInButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        signInButton.center = view.center
        view.addSubview(signInButton)
        (UIApplication.shared.delegate as! AppDelegate).signInCallBack = refreshUI
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signOutAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        nameLabel.text = ""
        emailLabel.text = ""
    }
    
}

extension ViewController:GIDSignInUIDelegate{
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        
    }
}
