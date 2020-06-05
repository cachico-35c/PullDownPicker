//
//  CustomPickerView.swift
//  takaphoto
//
//  Created by iOS開発 on 2019/11/20.
//  Copyright © 2019 iOS開発. All rights reserved.
//

import UIKit
//import SwiftyJSON

@objc protocol CustomPickerViewDelegate {
    func customPickerViewdidSelectRow(row: Int, tag: Int)
    func closeCustomPickerView(tag: Int)
}
class CustomPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return custom_list_items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.customDelegate?.customPickerViewdidSelectRow(row: row, tag: self.tag)
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return custom_list_items[row]
    }
    
    var CustomPickerView:UIPickerView = UIPickerView()
    var items = [""]
    var custom_list_items:[String] = []
    var baseScrenn:UIView = UIView()
    var closeBtn:UIButton = UIButton()
    var baseHeight:CGFloat = 162
    var customDelegate:CustomPickerViewDelegate?
    var closeFlg:Bool = true

    func initView(list_items:[String] , view: UIView){
        custom_list_items = list_items
        baseScrenn = view
        
        self.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.frame = CGRect(
            x: 0,
            y: self.baseScrenn.frame.height,
            width: self.baseScrenn.frame.width,
            height: baseHeight + 44
        )
        closeBtn.frame = CGRect(
            x: self.baseScrenn.frame.width - 120,
            y: 0,
            width: 120,
            height: 44
        )
        closeBtn.setTitle("閉じる", for: .normal)
        closeBtn.setTitleColor(.systemBlue, for: .normal)
        closeBtn.addTarget(self, action: #selector(closeAction(sender:)), for: .touchUpInside)
        self.addSubview(closeBtn)
        
        CustomPickerView.frame = CGRect(
            x: 0,
            y: 44,
            width: self.baseScrenn.frame.width,
            height: baseHeight
        )
        //162 //216
        CustomPickerView.delegate = self
        CustomPickerView.dataSource = self
        self.addSubview(CustomPickerView)
        
        view.addSubview(self)
        
    }
    
    @objc func closeAction(sender: UIBarButtonItem){
        print("閉じる")
        closePickerViewActionMethod()
    }

    func openPickerViewActionMethod(){
        closeFlg = false
        self.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(
                x: 0,
                y: self.baseScrenn.frame.height - (self.baseHeight + 20),
                width: self.baseScrenn.frame.width,
                height: self.baseHeight + 44
            )
        }, completion: {_ in
//            print("PickerViewBox:\(self.baseScrenn.frame)")
        })
    }
    
    func closePickerViewActionMethod(){
        closeFlg = true
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(
                x: 0,
                y: self.baseScrenn.frame.height,
                width: self.baseScrenn.frame.width,
                height: self.baseScrenn.frame.height
            )
        }, completion: {_ in
            self.isHidden = true
            self.customDelegate?.closeCustomPickerView(tag: self.tag)
        })
    }
    
    func reloadAllComponents(list_items:[String]) {
        custom_list_items = list_items
        CustomPickerView.reloadAllComponents()
    }
}
