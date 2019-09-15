//
//  TrialViewController.swift
//  test
//
//  Created by Rustam  on 9/15/19.
//  Copyright © 2019 Rustam . All rights reserved.
//

import UIKit

class TrialViewController: UIViewController {

    @IBOutlet weak var continueLbl: UILabel!
    @IBOutlet weak var button: RoundedCornersBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMultiColoredLabel()

    }

    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //функция изменяющая цвет части текста в UILabel
    func setMultiColoredLabel() {
        let str = "BUT YOU CAN CONTINUE WITH OUR SUBSCRIPTION, WHICH GIVES YOU FULL FREE 7 DAYS ACCESS"
        let trimmedString = str.trimmingCharacters(in: .whitespacesAndNewlines)

        let string = NSMutableAttributedString(string: trimmedString)
        string.setColor("FULL FREE 7 DAYS ACCESS", with: #colorLiteral(red: 0.3450980392, green: 0.7450980392, blue: 0.7058823529, alpha: 1))
        continueLbl.attributedText = string
    }
}

// расширение для изменения цвета части текста в UILabel
extension NSMutableAttributedString {
    
    func setColor(_ textToFind: String?, with color: UIColor) {
        
        let range: NSRange?
        if let text = textToFind {
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        } else {
            range = NSMakeRange(0, self.length)
        }
        
        if range?.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
        }
    }
}





