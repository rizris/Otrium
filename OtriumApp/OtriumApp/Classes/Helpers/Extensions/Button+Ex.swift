//
//  Button+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit

public enum UIButtonBorderSide {
    case Top, Bottom, Left, Right
}

extension UIButton {
    
    func leftRightEdges(_ value: Int = 10) {
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat(value), bottom: 0, right: CGFloat(value))
    }
    
    func leftPadding (){
        let _ = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    func rightPadding (){
        let _ = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func bottomPadding(_ value: Int = 10) {
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(value), right: 0)
    }
    func makeRightAlignment() {
        self.contentHorizontalAlignment = .right
    }
    
    func setupFontAndColor (_ color : String = Constant.Colors.TEXT_NORNAL)  {
        self.titleLabel?.font = UIFont(name: Constant.Strings.APP_FONT_NAME_BOLD, size: 20)
        self.setTitleColor(UIColor(hexString: color), for: .normal)
    }
    func setupNormalFontAndColor (_ color : String = Constant.Colors.APP_WHITE_BACKGROUND)  {
        self.titleLabel?.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 16)
        self.setTitleColor(UIColor(hexString: color), for: .normal)
    }
    func setupFontGray ()  {
        self.titleLabel?.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 16)
        self.setTitleColor(UIColor(hexString: Constant.Colors.TEXT_GRAY), for: .normal)
    }
    func setupBlueFont ()  {
        self.titleLabel?.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 16)
        self.setTitleColor(UIColor(hexString: Constant.Colors.PRIMARY_BLUE), for: .normal)
    }
    func setupFontAndBackColor (_ colorBack: String = Constant.Colors.PRIMARY_BLUE)  {
        self.backgroundColor = UIColor(hexString: colorBack)
        self.titleLabel?.font = UIFont(name: Constant.Strings.APP_FONT_NAME_BOLD, size: 16)
        self.setTitleColor(UIColor(hexString: Constant.Colors.PRIMARY_WHITE), for: .normal)
        self.layer.cornerRadius = 5
    }
    
    func imageWithBorderColor (_ radius: Int = 5) {
        self.backgroundColor = UIColor(hexString: Constant.Colors.PRIMARY_WHITE)
        self.layer.borderColor = UIColor(hexString: Constant.Colors.PRIMARY_BLUE)?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = CGFloat(radius)
    }
    func imageWithBackgroundColor (_ radius: Int = 5) {
        self.backgroundColor = UIColor(hexString: Constant.Colors.PRIMARY_BLUE)
        self.layer.cornerRadius = CGFloat(radius)
    }
    func plainButton (_ radius: Int = 5) {
        self.backgroundColor = Constant.Colors.CLEAR
        self.layer.cornerRadius = 5
    }
    func setupTextBackground ()  {
        self.titleLabel?.font = UIFont(name: Constant.Strings.APP_FONT_NAME, size: 16)
        self.setTitleColor(UIColor(hexString: Constant.Colors.TEXT_NORNAL), for: .normal)
        self.backgroundColor = UIColor(hexString: Constant.Colors.TEXT_BACKGROUND)
        self.layer.cornerRadius = 5
    }
    
    func addBottomBorderWithColor(_ color: String, _ width: CGFloat) {
        let border = CALayer()
        border.borderColor = UIColor(hexString: color)?.cgColor
        //border.backgroundColor = UIColor(hexString: color)?.cgColor
        border.borderWidth = 4
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }
    
    public func addBorder(side: UIButtonBorderSide, color: String, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor(hexString: color)?.cgColor
        
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }
   
}


