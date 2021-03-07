//
//  MainCell+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import SwiftHEXColors
import SnapKit

extension MainCell {
    
    func setupUIControls () {
        self.removeObjects()
        self.setupUI()
        
        contentView.addSubview(mainView)
        mainView.addSubview(cellName)
        mainView.addSubview(cellDescription)
        mainView.addSubview(cellEmail)
        mainView.addSubview(cellImage)
        mainView.addSubview(cellFollowers)
        mainView.addSubview(cellFollowing)
        
        self.setupUIConstraints()
    }
    
    private func setupUI() {
        self.mainView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 5
            return view
        }()
        self.cellImage = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "girl")
            imgView.contentMode = .scaleAspectFit
            imgView.layer.cornerRadius = 50
            imgView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imgView.clipsToBounds = true
            return imgView
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
        self.cellEmail = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
        self.cellFollowers = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
        self.cellFollowing = {
            let label = UILabel()
            label.text = ""
            label.fontAndColorNoBackground()
            return label
        }()
    }
        
    private func setupUIConstraints () {
        self.mainView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        self.cellImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(5)
            make.left.equalTo(mainView.snp.left).offset(10)
            //make.trailing.equalTo(mainView.snp.trailing).offset(-10)
            make.height.width.equalTo(100)
        }
        self.cellName.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(20)
            make.left.equalTo(cellImage.snp.right).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(30)
        }
        self.cellDescription.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellName.snp.bottom).offset(5)
            make.left.equalTo(cellImage.snp.right).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(cellName)
        }
        self.cellEmail.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellImage.snp.bottom).offset(20)
            make.left.equalTo(mainView.snp.left).offset(10)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(cellName)
        }
        self.cellFollowers.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellEmail.snp.bottom).offset(10)
            make.left.equalTo(mainView.snp.left).offset(10)
            //make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(cellName)
            make.width.equalTo(120)
        }
        self.cellFollowing.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(cellEmail.snp.bottom).offset(10)
            make.left.equalTo(cellFollowers.snp.right).offset(10)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(cellName)
            make.bottom.equalTo(mainView.snp.bottom).offset(-5)
        }
       
    
    }
    
    private func removeObjects(){
        mainView.removeFromSuperview()
    }
        

}
