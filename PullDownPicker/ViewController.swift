//
//  ViewController.swift
//  PullDownPicker
//
//  Created by iOS開発 on 2020/06/03.
//  Copyright © 2020 iOS開発. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional  after loading the view.
    }
    @IBAction func goScene_0(sender:UIButton){
        self.performSegue(withIdentifier: "nextScene_0",sender: nil)
    }
    @IBAction func goScene_1(sender:UIButton){
        self.performSegue(withIdentifier: "nextScene_1",sender: nil)
    }
    @IBAction func goScene_2(sender:UIButton){
        self.performSegue(withIdentifier: "nextScene_2",sender: nil)
    }
    @IBAction func goScene_3(sender:UIButton){
        self.performSegue(withIdentifier: "nextScene_3",sender: nil)
    }


}

