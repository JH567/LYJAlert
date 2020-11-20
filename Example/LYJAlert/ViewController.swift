//
//  ViewController.swift
//  LYJAlert
//
//  Created by liuyj on 11/16/2020.
//  Copyright (c) 2020 liuyj. All rights reserved.
//

import UIKit
import LYJAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        LYJAlert.showAlert(title: "提示", message: "nishi sb ma")
//
//        LYJAlert.showAlert(title: "提示", messageL: "nishi sb ma", cancleTitle: "cancle") { (action) in
//            print("\(action.title ?? "")")
//        }
        
        LYJAlert.showAlert(title: "提示", message: "nishi sb ma", cancleTitle: "cancle", defaultTitle: "default") { (action) in
            print("\(action.title ?? "")")
        } defaultBlock: { (action) in
            print("\(action.title ?? "")")
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

