//
//  ViewController.swift
//  MyOclock
//
//  Created by 濱貴大 on 2020/09/27.
//  Copyright © 2020 thama. All rights reserved.
//


//
import UIKit


class ViewController: UIViewController {

    
    
//時間
    @IBOutlet weak var NowTime: UILabel!
    
    let dt = Date()
    let dateFormatter = DateFormatter()
    
    
   //ストップウォッチのボタン
    @IBAction func StopWatch(_ sender: Any) {
        
        
        
        
    }
    
   //日付
    @IBOutlet weak var NowDay: UILabel!
    
    
        
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        
        
        //１秒毎に進む
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerUpdate), userInfo: nil, repeats: true)
        
           
        //日付設定1
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd(EEE)", options: 0,locale: Locale(identifier: "ja_JP"))
        
        let date = dateFormatter.string(from: dt)
        print(date)
        
        //↑変数　日付表示
        NowDay.text = date
        
        let arrWeekday: Array = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        
       let date1 = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)

        
        _ = calendar?.component(.year, from: date1 as Date)
        
        _ = calendar?.component(.month, from: date1 as Date)
        
        _ = calendar?.component(.day, from: date1 as Date)
        
        let weekday = calendar?.component(.weekday, from: date1 as Date)
        
    
        _ = arrWeekday[weekday! - 1]
        

        //時間設定
       let date2:Date = Date()
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        
        let Date2 = format.string(from: date2)
        
        print(Date2)
        
        NowTime.text =  Date2
        
        //時
        _ = calendar?.component(.hour, from: date1 as Date)
        
        //分
        _ = calendar?.component(.minute, from: date1 as Date)
        
        
        //秒
        _ = calendar?.component(.second, from: date1 as Date)
        
        
        
        
        
        
        
    }
    //１秒毎に進む内容を記載
    @objc func timerUpdate() {
        
        
        let date2:Date = Date()
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        
        let Date2 = format.string(from: date2)
        print("update")
        
        NowTime.text =  Date2
        
    }
    
    
    
    
    
    
    
    

}

