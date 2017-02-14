//
//  View2.swift
//  pushView
//
//  Created by Loc Tran on 2/13/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class View2: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var users = ["player1":"pwP1","player2":"pwP2","player3":"pwP3"]
    
    @IBOutlet weak var txtview_display: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func action_Pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func action_Login(_ sender: Any) {
        if let password = users[usernameTextField.text!]{
            if password == passwordTextField.text{
                let v3 = self.storyboard?.instantiateViewController(withIdentifier: "V3") as! View3
                self.navigationController?.pushViewController(v3, animated: true)
                txtview_display.isHidden = true
            }else{
                txtview_display.isHidden = false
                txtview_display.text = "Invalid Password"
                
            }
        }else{
            txtview_display.isHidden = false
            txtview_display.text = "Invalid Account"
        }
    }
    
    @IBAction func action_Account(_ sender: Any) {
        var fullAccDetails = ""
        for (key, value) in users{
            fullAccDetails += "\(key): \(value)\n"
            txtview_display.isHidden = false
            txtview_display.text = fullAccDetails
        }
    }
    
    @IBAction func action_Register(_ sender: Any) {
        if let password = users[usernameTextField.text!]{
            txtview_display.isHidden = false
            txtview_display.text = "Account already existed"
        }else{
            users[usernameTextField.text!] = passwordTextField.text
            txtview_display.isHidden = false
            txtview_display.text = "\(usernameTextField.text!) is added"
            usernameTextField.text = "Username"
            passwordTextField.text = "Password"
        }
    }
    
    
    @IBAction func action_Remove(_ sender: Any) {
        if let password = users[usernameTextField.text!]{
            if password == passwordTextField.text{
                users[usernameTextField.text!] = nil
                txtview_display.text = "\(usernameTextField.text!) is removed"
            }else{
                txtview_display.isHidden = false
                txtview_display.text = "Enter valid password to remove account"
                
            }
        }else{
            txtview_display.isHidden = false
            txtview_display.text = "Account does not exist"
        }
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
