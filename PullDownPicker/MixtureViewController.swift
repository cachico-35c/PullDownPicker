//
//  MixtureViewController.swift
//  PullDownPicker
//
//  Created by iOS開発 on 2020/06/03.
//  Copyright © 2020 iOS開発. All rights reserved.
//

import UIKit

class MixtureViewController: UIViewController, PullDownTextFieldDelegate, CustomDatePickerViewDelegate, CustomPickerViewDelegate {
    
    var cDatePickerView:CustomDatePickerView!
    let DateTextFeild:PullDownTextField = PullDownTextField()
    
    var cPickerView:CustomPickerView!
    let PickerTextField:PullDownTextField = PullDownTextField()
    var demo_items = ["Lemon","馬と鹿","マリーゴールド","まちがいさがし","HAPPY BIRTHDAY","パプリカ","Pretender","Flamingo","白日","アイノカタチ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        setDatePicker()
        setPickerView()
    }
    
    func setUp(){
        
        self.navigationItem.title = "PullDown+DatePicker+PickerView"
        
        // DatePicker用
        DateTextFeild.frame = CGRect(x: 10, y: 100, width: 300, height: 50)
        DateTextFeild.setUp()
        DateTextFeild.layer.borderWidth = 1
        DateTextFeild.layer.borderColor = UIColor.lightGray.cgColor
        DateTextFeild.layer.cornerRadius = 10
        DateTextFeild.customDelegate = self
        DateTextFeild.tag = 1
        self.view.addSubview(DateTextFeild)
        
        // PickerView用
        PickerTextField.frame = CGRect(x: 10, y: 200, width: 300, height: 50)
        PickerTextField.setUp()
        PickerTextField.layer.borderWidth = 1
        PickerTextField.layer.borderColor = UIColor.lightGray.cgColor
        PickerTextField.layer.cornerRadius = 10
        PickerTextField.customDelegate = self
        PickerTextField.tag = 2
        self.view.addSubview(PickerTextField)
    }
    
    // DatePickerのカスタムクラスをセットアップ ①
    func setDatePicker(){
        
        cDatePickerView = CustomDatePickerView()
        cDatePickerView.initView(view: self.view, min: "2019-01-01", max: "2020-12-31", dateFormat: "yyyy/MM/dd")
        cDatePickerView.customDelegate = self
        
    }
    // PickerViewのカスタムクラスをセットアップ ②
    func setPickerView(){
        
        cPickerView = CustomPickerView()
        cPickerView.initView(list_items: demo_items, view: self.view)
        cPickerView.customDelegate = self
    }
    
    
    // PullDownTextFieldDelegate ③
    func openPicker(textField: PullDownTextField) {
        
        if textField.tag == 1 {
            
            self.view.endEditing(true)
            if !cPickerView.closeFlg {
                UIView.animate(withDuration: 0.2, animations: {
                    self.cPickerView.closePickerViewActionMethod()
                }, completion: {_ in
                    self.cDatePickerView.openPickerViewActionMethod()
                })
            }else{
                cDatePickerView.openPickerViewActionMethod()
            }
        }else if textField.tag == 2 {

            self.view.endEditing(true)
            if !cDatePickerView.closeFlg {
                UIView.animate(withDuration: 0.2, animations: {
                    self.cDatePickerView.closePickerViewActionMethod()
                }, completion: {_ in
                    self.cPickerView.openPickerViewActionMethod()
                })
            }else{
                cPickerView.openPickerViewActionMethod()
            }
        }
    }
    // CustomDatePickerViewDelegate ④
    func customDatePickerValue(dateString: String) {
        DateTextFeild.text = dateString
    }
    // CustomPickerViewDelegate　⑤
    func customPickerViewdidSelectRow(row: Int, tag: Int) {
        PickerTextField.text = demo_items[row]
    }
    
    func closeCustomPickerView(tag: Int) {
        //未使用
    }
}
