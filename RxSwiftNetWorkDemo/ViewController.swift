//
//  ViewController.swift
//  RxSwiftNetWorkDemo
//
//  Created by C on 2018/4/12.
//  Copyright © 2018年 C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        self.perform(#selector(ViewController.test), with: nil, afterDelay: 1)
//        HttpLoadServer.show()
        self.perform(#selector(ViewController.hidden), with: nil, afterDelay: 7)
    }
    
    @objc func  hidden() -> () {
        HttpLoadServer.hidden()
    }
    
    @objc func test() -> () {
      HttpLoadServer.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
}

