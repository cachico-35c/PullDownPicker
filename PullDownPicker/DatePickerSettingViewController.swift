//
//  DatePickerSettingViewController.swift
//  PullDownPicker
//
//  Created by iOS開発 on 2020/06/03.
//  Copyright © 2020 iOS開発. All rights reserved.
//

import UIKit

class DatePickerSettingViewController: UIViewController, PullDownTextFieldDelegate, CustomDatePickerViewDelegate {
    
    var cDatePickerView:CustomDatePickerView!
    let textFeild:PullDownTextField = PullDownTextField()
    
    // CustomDatePickerViewDelegate
    func customDatePickerValue(dateString: String) {
        textFeild.text = dateString
    }
    // PullDownTextFieldDelegate
    func openPicker(textField: PullDownTextField) {
        self.view.endEditing(true)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.cDatePickerView.openPickerViewActionMethod()
        }, completion: {_ in
        })
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        setDatePicker()
    }
    

    func setUp(){
        
        self.navigationItem.title = "PullDown+DatePicker"
        
        textFeild.frame = CGRect(x: 10, y: 100, width: 200, height: 50)
        textFeild.setUp()
        textFeild.layer.borderWidth = 1
        textFeild.layer.borderColor = UIColor.lightGray.cgColor
        textFeild.layer.cornerRadius = 10
        textFeild.customDelegate = self
        
        self.view.addSubview(textFeild)
        
    }
    
    func setDatePicker(){
        
        cDatePickerView = CustomDatePickerView()
        cDatePickerView.initView(view: self.view, min: "2019-01-01", max: "2020-12-31", dateFormat: "yyyy/MM/dd")
        cDatePickerView.customDelegate = self
        
    }

}
