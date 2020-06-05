//
//  PickerViewSettingViewController.swift
//  PullDownPicker
//
//  Created by iOS開発 on 2020/06/03.
//  Copyright © 2020 iOS開発. All rights reserved.
//

import UIKit

class PickerViewSettingViewController: UIViewController, PullDownTextFieldDelegate, CustomPickerViewDelegate {
    
    var cPickerView:CustomPickerView!
    @IBOutlet var textField:PullDownTextField!
    var demo_items = ["JavaScript","Python","Java","PHP","C#","C++","TypeScript","Shell","C","Ruby"]
    
    // CustomPickerViewDelegate
    func customPickerViewdidSelectRow(row: Int, tag: Int) {
        textField.text = demo_items[row]
    }
    
    func closeCustomPickerView(tag: Int) {
        // 未使用
    }
    
    // PullDownTextFieldDelegate
    func openPicker(textField: PullDownTextField) {
        self.cPickerView.openPickerViewActionMethod()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        setPickerView()
    }
    
    func setUp(){
        
        self.navigationItem.title = "PullDown+PickerView"
        
        textField.customDelegate = self

    }
    func setPickerView(){
        
        cPickerView = CustomPickerView()
        cPickerView.initView(list_items: demo_items, view: self.view)
        cPickerView.customDelegate = self
    }
}
