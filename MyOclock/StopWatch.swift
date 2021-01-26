//
//  StopWatch.swift
//  MyOclock
//
//  Created by 濱貴大 on 2020/10/01.
//  Copyright © 2020 thama. All rights reserved.
//

import UIKit

class StopWatch: UIViewController {
    
    var countNum = 0
    var timerRunning = false
    var timer = Timer()
    
    @objc func updateDisplay(){
        countNum += 1
        let ms = countNum % 100
        let s = (countNum - ms) / 100 % 60
        let m = (countNum - s - ms) / 6000 % 3600
        timeDisplay.text = String(format: "%02d:%02d.%02d", m,s,ms)
    }
    
    
    @IBOutlet weak var timeDisplay: UILabel!
    
    @IBAction func StartButton(_ sender: Any) {
        
        if timerRunning == false{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(StopWatch.updateDisplay), userInfo: nil, repeats: true)
            
            timerRunning = true
        }
        
    }
    
    
    @IBAction func StopButton(_ sender: Any) {
        
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
        }
        
    }
    
    
    @IBAction func ClearButton(_ sender: Any) {
        countNum = 0
        timeDisplay.text = "00:00.00"
        
        
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        
        
        
        
        
    }
    
    @IBAction func Back(_ sender: Any) {
        //戻る
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
