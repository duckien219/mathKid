//
//  View3.swift
//  pushView
//
//  Created by Loc Tran on 2/13/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class View3: UIViewController {

    @IBOutlet weak var labelRight: UILabel!
    @IBOutlet weak var labelWrong: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var labelNumA: UILabel!
    @IBOutlet weak var labelNumB: UILabel!
    @IBOutlet weak var labelSign: UILabel!
    
    @IBOutlet weak var buttonResult1: UIButton!
    @IBOutlet weak var buttonResult2: UIButton!
    @IBOutlet weak var buttonResult3: UIButton!
    
    var right = 0
    var wrong = 0
    var counter = 10
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        start()
    }
   
    @IBAction func buttonResults(_ sender: UIButton) {
        checkResult(sender)
        setRandom()
        start()
    }
    
    func updateCounter(){
        if counter > 0{
            counter -= 1
        }else{
            wrong += 1
            labelWrong.text = String("Wrong: \(wrong)")
            counter = 10
            setRandom()
        }
        
        labelTime.text = String("Time: \(counter)")
    }
    
    func start(){
        counter = 10
    }
    
    func reset(){
        myTimer.invalidate()
    }
    
    func setRandom(){
        var random1 = Int(arc4random_uniform(10))
        var random2 = Int(arc4random_uniform(10))
        
        labelNumA.text = String(random1)
        labelNumB.text = String(random2)
        
        let randomSign = Int(arc4random_uniform(4))
        if randomSign == 0{
            labelSign.text = String("+")
        }
        if randomSign == 1{
            labelSign.text = String("-")
        }
        if randomSign == 2{
            labelSign.text = String("*")
        }
        if randomSign == 3{
            labelSign.text = String("/")
            random2 = Int(arc4random_uniform(9)) + 1
            random1 = random2 * Int(arc4random_uniform(10))
            labelNumA.text = String(random1)
            labelNumB.text = String(random2)
        }
        
        setResult()
    }
    
    func checkResult(_ sender: UIButton){
        
        let result = getResult()
        let playerResult = Int(sender.currentTitle!)!
        if playerResult == result{
            right += 1
            labelRight.text = String("Right: \(right)")
        }else{
            wrong += 1
            labelWrong.text = String("Wrong: \(wrong)")
        }
    }
    
    func setResult(){
    
        var R = [0,0,0]
        let result = getResult()
        let pos = Int(arc4random_uniform(3))
        var num1 = Int(arc4random_uniform(10))
        var num2 = Int(arc4random_uniform(10))
        while(num1 == num2 || num1 == result || num2 == result){
            num1 = Int(arc4random_uniform(10))
            num2 = Int(arc4random_uniform(10))
        }
        
        if pos == 0{
            R = [result, num1, num2]
            buttonResult1.setTitle(String(R[0]), for: .normal)
            buttonResult2.setTitle(String(R[1]), for: .normal)
            buttonResult3.setTitle(String(R[2]), for: .normal)
        }
        if pos == 1{
            R = [num1, result, num2]
            buttonResult1.setTitle(String(R[0]), for: .normal)
            buttonResult2.setTitle(String(R[1]), for: .normal)
            buttonResult3.setTitle(String(R[2]), for: .normal)
        }
        if pos == 2{
            R = [num1, num2, result]
            buttonResult1.setTitle(String(R[0]), for: .normal)
            buttonResult2.setTitle(String(R[1]), for: .normal)
            buttonResult3.setTitle(String(R[2]), for: .normal)
        }
        
    }
    
    func getResult()->Int{
        var result = 0
        if labelSign.text == String("+"){
            result = add(num1: Int(labelNumA.text!)!, num2: Int(labelNumB.text!)!)
        }
        if labelSign.text == String("-"){
            result = sub(num1: Int(labelNumA.text!)!, num2: Int(labelNumB.text!)!)
        }
        if labelSign.text == String("*"){
            result = mulp(num1: Int(labelNumA.text!)!, num2: Int(labelNumB.text!)!)
        }
        if labelSign.text == String("/"){
            result = div(num1: Int(labelNumA.text!)!, num2: Int(labelNumB.text!)!)
        }
        return result
    }
    
    func add(num1: Int, num2: Int)->Int{
        return (num1 + num2)
    }
    
    func sub(num1: Int, num2: Int)->Int{
        return (num1 - num2)
    }
    
    func mulp(num1: Int, num2: Int)->Int{
        return (num1 * num2)
    }
    
    func div(num1: Int, num2: Int)->Int{
        return (num1 / num2)
    }
    
    
    
    @IBAction func action_Pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
