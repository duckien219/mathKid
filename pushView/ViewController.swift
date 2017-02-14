//
//  ViewController.swift
//  pushView
//
//  Created by Loc Tran on 2/13/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image_logo: UIImageView!
    @IBOutlet weak var image_Login: UIButton!
    @IBOutlet weak var label_name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image_logo.alpha = 0
        image_Login.alpha = 0
        label_name.alpha = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 5, animations: {self.image_logo!.alpha = 1})
        UIView.animate(withDuration: 5, animations: {
                            self.image_Login!.alpha = 1
                            self.image_Login!.center = CGPoint(x: self.image_logo!.center.x, y: 570)})
        
        UIView.animate(withDuration: 5, animations: {
                                    self.label_name!.alpha = 1
                                    self.label_name!.center = CGPoint(x: self.image_logo!.center.x, y: 646)})
        

    }
    
    @IBAction func action_Push(_ sender: Any) {
        let v2 = self.storyboard?.instantiateViewController(withIdentifier: "V2") as! View2
        self.navigationController?.pushViewController(v2, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

