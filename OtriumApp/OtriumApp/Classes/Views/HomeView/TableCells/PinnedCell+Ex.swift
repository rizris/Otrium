//
//  PinnedCell+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import SwiftHEXColors
import SnapKit

extension PinnedCell {
    
    func setupUIControls () {
        self.removeObjects()
        self.setupUI()
        
        contentView.addSubview(mainView)
        mainView.addSubview(cellLogin)
        mainView.addSubview(cellName)
        mainView.addSubview(cellDescription)
        mainView.addSubview(cellImage)
        mainView.addSubview(cellFork)
        mainView.addSubview(cellLanguage)
        mainView.addSubview(imgStar)
        mainView.addSubview(imgCircle)
        
        self.setupUIConstraints()
    }
    
    private func setupUI() {
        self.mainView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 5
            view.layer.borderColor = UIColor(hexString: Constant.Colors.GRAY_LIGHT)?.cgColor
            view.layer.borderWidth = 1
            return view
        }()
        self.cellImage = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "girl")
            imgView.contentMode = .scaleAspectFit
            imgView.layer.cornerRadius = 25
            imgView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            imgView.clipsToBounds = true
            return imgView
        }()
        self.imgStar = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "star")
            imgView.contentMode = .scaleAspectFit
            return imgView
        }()
        self.imgCircle = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "circle")
            imgView.contentMode = .scaleAspectFit
            return imgView
        }()
        self.cellLogin = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
        self.cellName = {
            let label = UILabel()
            label.text = ""
            label.fontTitleColorNoBackground()
            return label
        }()
        self.cellDescription = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
        self.cellFork = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
        self.cellLanguage = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
      
    }
        
    private func setupUIConstraints () {
        self.mainView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        self.cellImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(5)
            make.left.equalTo(mainView.snp.left).offset(10)
            make.height.width.equalTo(50)
        }
        self.cellLogin.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(cellImage)
            //make.top.equalTo(mainView.snp.top).offset(5)
            make.left.equalTo(cellImage.snp.right).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(30)
        }
        self.cellName.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellImage.snp.bottom).offset(10)
            make.left.equalTo(mainView.snp.left).offset(10)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(30)
        }
        self.cellDescription.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellName.snp.bottom).offset(10)
            make.left.equalTo(mainView.snp.left).offset(10)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(30)
        }
        self.imgStar.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(cellFork)
            make.left.equalTo(mainView.snp.left).offset(10)
            make.height.width.equalTo(15)
        }
        self.cellFork.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellDescription.snp.bottom).offset(20)
            make.left.equalTo(imgStar.snp.right).offset(5)
            //make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        self.imgCircle.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(cellLanguage)
            make.left.equalTo(cellFork.snp.right).offset(20)
            make.height.width.equalTo(15)
        }
        self.cellLanguage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellDescription.snp.bottom).offset(20)
            make.left.equalTo(imgCircle.snp.right).offset(5)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(cellFork)
            make.bottom.equalTo(mainView.snp.bottom).offset(-10)
        }
       
    
    }
    
    private func removeObjects(){
        mainView.removeFromSuperview()
    }
        

}
