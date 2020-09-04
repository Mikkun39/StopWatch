//
//  ViewController.swift
//  StopWatch
//
//  Created by 高山瑞基 on 2020/09/04.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    @IBOutlet var hanteilabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval:0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        
        hanteilabel.text = ""
        
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
        
        self.hantei()
    }
    
    func hantei(){
        if count > 9.80 && count < 10.20{
            hanteilabel.text = "PERFECT!"
        } else if count > 9.70 && count < 10.30{
            hanteilabel.text = "GREAT!"
        } else if count > 9.60 && count < 10.40{
            hanteilabel.text = "GOOD!"
        } else{
            hanteilabel.text = "BAD!"
        }
        
    }
    
    @IBAction func reset(){
         if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
        
    }


}

