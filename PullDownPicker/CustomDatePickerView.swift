//
//  CustomDatePickerView.swift
//  takaphoto
//
//  Created by iOS開発 on 2019/11/22.
//  Copyright © 2019 iOS開発. All rights reserved.
//

import UIKit

@objc protocol CustomDatePickerViewDelegate {
    func customDatePickerValue(dateString: String)
}
class CustomDatePickerView: UIView {

    var CustomDatePicker:UIDatePicker! = UIDatePicker()
    var baseScrenn:UIView = UIView()
    var closeBtn:UIButton = UIButton()
    var baseHeight:CGFloat = 216
    var customDelegate:CustomDatePickerViewDelegate?
    var closeFlg:Bool = true
    var customDateFormat:String = "YYYY/MM/DD"
    
    // 初期化　minとmaxはdatepickerの最小と最大をセット　空は設定なし
    func initView(view:UIView, min:String, max:String, dateFormat:String){
        baseScrenn = view
        customDateFormat = dateFormat
        
        CustomDatePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        CustomDatePicker.datePickerMode = UIDatePicker.Mode.date
        CustomDatePicker.timeZone = NSTimeZone.local
        CustomDatePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale // 言語指定
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = customDateFormat
        if min.count > 0 {
            let minDate = dateFormatter.date(from: min)
            CustomDatePicker.minimumDate = minDate
        }
        if max.count > 0 {
            let maxDate = dateFormatter.date(from: max)
            CustomDatePicker.maximumDate = maxDate
        }
        if customDateFormat == "HH:mm" {
            CustomDatePicker.date = dateFormatter.date(from: "00:00")!
            CustomDatePicker.datePickerMode = UIDatePicker.Mode.time
            CustomDatePicker.minuteInterval = 30
        }
        
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

        CustomDatePicker.frame = CGRect(
            x: 0,
            y: 44,
            width: self.baseScrenn.frame.width,
            height: baseHeight
        )
        //162 //216
        self.addSubview(CustomDatePicker)
        
        view.addSubview(self)
        
    }
    @objc func closeAction(sender: UIBarButtonItem){
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
        })
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = customDateFormat
        
        let dateString:String = dateFormatter.string(from: sender.date)
        print("\(dateFormatter.string(from: sender.date))")
        self.customDelegate?.customDatePickerValue(dateString: dateString)
    }
    
    func setDateString(setDateString:String){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = customDateFormat
        CustomDatePicker.date = dateFormatter.date(from: setDateString)!

    }
    
    func getDateString() -> String {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
        return formatter.string(from: date as Date)
    }

}
