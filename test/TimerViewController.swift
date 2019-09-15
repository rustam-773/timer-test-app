//
//  ViewController.swift
//  test
//
//  Created by Rustam  on 9/15/19.
//  Copyright © 2019 Rustam . All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLbl: UILabel!
    
    //при запуске приложения включается таймер на 6 секунд
    //при окончании которого открывается новое окно
    var seconds = 6
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //функция для форматирования текста в UILabel отображающего таймер в виде 00:00:00
    func timeFormatting(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            performSegue(withIdentifier: "timerSegue", sender: self)
        } else {
            seconds -= 1
            timerLbl.text = timeFormatting(time: TimeInterval(seconds))
        }        
    }
}

