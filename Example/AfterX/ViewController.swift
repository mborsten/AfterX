//
//  ViewController.swift
//  AfterX
//
//  Created by Marcel Borsten on 04/07/2017.
//  Copyright (c) 2017 Marcel Borsten. All rights reserved.
//

import UIKit
import AfterX

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onceButtonAction(_ sender: Any) {
        AfterX.doOnce(task: "once_action") {
            self.showAlert()
        }
    }

    @IBAction func onceAfterFiveAction(_ sender: Any) {
        AfterX.do(task: "once_after_five", after: 5) {
            self.showAlert()
        }
    }


    @IBAction func alwaysAfterFiveAction(_ sender: Any) {
        AfterX.do(task: "always_after_five", after: 5, once: false) {
            self.showAlert()
        }
    }

    @IBAction func resetAction(_ sender: Any) {
        AfterX.resetAll()
    }

    func showAlert() {
        let alert = UIAlertController(title: "Conditions were met", message: "Tap 'reset' to try again", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

