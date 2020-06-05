//
//  PullDownViewController.swift
//  PullDownPicker
//
//  Created by iOS開発 on 2020/06/03.
//  Copyright © 2020 iOS開発. All rights reserved.
//

import UIKit

class PullDownViewController: UIViewController, PullDownTextFieldDelegate {
    
    func openPicker(textField: PullDownTextField) {
        alert(message: "ここで処理を行います。", title: "お知らせ")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
        

    func setUp(){
        
        self.navigationItem.title = "PullDownの実装のみ"
        
        // storyboadに配置する場合はカスタムクラスに指定　以下の①だけ記載すればOK
        let textFeild:PullDownTextField = PullDownTextField()
        textFeild.frame = CGRect(x: 10, y: 100, width: 200, height: 50)
        textFeild.setUp()
        textFeild.layer.borderWidth = 1
        textFeild.layer.borderColor = UIColor.lightGray.cgColor
        textFeild.layer.cornerRadius = 10
        // ①PullDownTextFieldのデリゲート指定
        textFeild.customDelegate = self
        
        self.view.addSubview(textFeild)
        
    }
    
    func alert(message:String,title:String){
        let myAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
        }
        myAlert.addAction(myOkAction)
        present(myAlert, animated: true, completion: nil)
    }

}
