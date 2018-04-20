//
//  ViewController.swift
//  RxSwiftNetWorkDemo
//
//  Created by C on 2018/4/12.
//  Copyright © 2018年 C. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HomeVM().requst().asObservable().subscribe(onNext: { (a) in
            print(a)
        }, onError: { (error) in
            
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
}

