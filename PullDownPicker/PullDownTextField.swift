//
//  PullDownTextField.swift
//  takaphoto
//
//  Created by iOS開発 on 2020/05/26.
//  Copyright © 2019 iOS開発. All rights reserved.
//

//
//  PullDownTextField Class  ver2.0
//

//  AutoLayoutのコード制御
//  https://qiita.com/yucovin/items/4bebcc7a8b1088b374c9
//
//  プルダウンのピッカーのViewを呼び出すUItextFieldを継承したクラス
//  TextFieldの上にTapGestureをaddした透明のUIViewがありタップを検知する（矢印付き）
//  delegateメソッドとして「func openPicker(textField: PullDownTextField)」がある。

import UIKit

@objc protocol PullDownTextFieldDelegate {
    func openPicker(textField: PullDownTextField)
}
class PullDownTextField: UITextField, UIGestureRecognizerDelegate {
    
    var customDelegate:PullDownTextFieldDelegate?
    var margin:CGFloat = 10
    var standrdSize:CGFloat = 10
    let triangleView:UIImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUp()
    }
    
    func setUp(){
        self.textAlignment = .center
        triangleView.image = imagePath()

        triangleView.frame = CGRect(
            x: self.frame.size.width - (self.frame.size.height - (margin * 0)) - margin ,
            y: margin ,
            width: standrdSize,
            height: standrdSize
        )

        self.addSubview(triangleView)
        
        // Autolayout Constract Start
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        triangleView.widthAnchor.constraint(equalToConstant: standrdSize).isActive = true
        triangleView.heightAnchor.constraint(equalToConstant: standrdSize).isActive = true
        
        self.rightAnchor.constraint(equalTo: triangleView.rightAnchor, constant: 10.0).isActive = true
        self.topAnchor.constraint(equalTo: triangleView.topAnchor, constant: -(self.frame.size.height - standrdSize)/2).isActive = true
        // Autolayout Constract End
        
        
        let tapView:UIView = UIView()
        tapView.tag = 100
        tapView.isUserInteractionEnabled = true
        tapView.frame = CGRect(
            x: 0,
            y: 0,
            width: self.frame.size.width,
            height: self.frame.size.height
        )
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(tapped(_:)))
        tapView.addGestureRecognizer(tapGesture)
        self.addSubview(tapView)
        
    }
    func modHeight(height: CGFloat){
        self.frame.size.height = height
        let tapView:UIView = self.viewWithTag(100)!
        tapView.frame.size.height = height
        self.topAnchor.constraint(
            equalTo: triangleView.topAnchor,
            constant: -(height/2) + triangleView.frame.size.width/2
        ).isActive = true
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        self.customDelegate?.openPicker(textField: self)
    }
    
    
    func imagePath() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
        UIColor.blue.setStroke()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 25))
        path.addLine(to: CGPoint(x: 50, y: 75))
        path.addLine(to: CGPoint(x: 100, y: 25))
        path.close()
        
        UIColor.black.setFill()
        path.fill()
        
        UIColor.black.setStroke()
        path.lineWidth = 0
        path.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    

}
