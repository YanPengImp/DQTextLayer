//
//  ViewController.swift
//  DQTextLayer
//
//  Created by Imp on 2018/4/28.
//  Copyright © 2018年 jingbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let textView = DQTextView.init(frame: CGRect.init(x: 20, y: 200, width: 260, height: 40))
        self.view.addSubview(textView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

