//
//  ViewController.swift
//  TestStopWatch03
//
//  Created by D7703_24 on 2019. 4. 2..
//  Copyright © 2019년 D7703_24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var TimeLable: UILabel!
    @IBOutlet weak var startBtn: UIBarButtonItem!
    @IBOutlet weak var pauseBtn: UIBarButtonItem!
    @IBOutlet weak var stopBtn: UIBarButtonItem!
    
    var count = 0
    var myTimer = Timer()
    //var TimerSet = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeLable.text = "00:00:00"
        print(myTimer.isValid)  //false
        
        changeBtnState(start: true, pause: false, stop: false)
    }
    @IBAction func PlayBtn(_ sender: Any) {
        if !myTimer.isValid{
        myTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            print("StartButton = \(myTimer.isValid)")
            changeBtnState(start: false, pause: true, stop: true)
        }

    }
    
    @IBAction func PauseBtn(_ sender: Any) {
        myTimer.invalidate()
       changeBtnState(start: true, pause: false, stop: true)
    }
    
    @IBAction func StopBtn(_ sender: Any) {
        myTimer.invalidate()
        print(myTimer.isValid)
        
        count = 0
        TimeLable.text = "00:00:00"
        changeBtnState(start: true, pause: false, stop: false)
    }
    
    @objc func updateTime() {
        count += 1
        let min = count / 6000
        let sec = count / 100 - (min*60)
        let msec = count % 100
        let output = String(format: "%02d:%02d:%02d", min, sec, msec)
        TimeLable.text = output
    }
    
    func changeBtnState(start: Bool, pause: Bool, stop: Bool){
        startBtn.isEnabled = start
        pauseBtn.isEnabled = pause
        stopBtn.isEnabled = stop
        
    }
    
}

