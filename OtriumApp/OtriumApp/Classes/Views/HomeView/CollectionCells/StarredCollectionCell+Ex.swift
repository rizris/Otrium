//
//  StarredCollectionCell+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import SwiftHEXColors
import SnapKit

extension StarredCollectionCell {
    
    func setupUIControls () {
        self.removeObjects()
        
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
        
    private func setupUIConstraints () {
        self.mainView.snp.makeConstraints{ (make) -> Void in
            make.top.left.right.equalTo(self.contentView).offset(0)
            make.bottom.equalTo(contentView).offset(-1)
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
            make.height.greaterThanOrEqualTo(25)
            make.width.equalTo(70)
            make.bottom.equalTo(mainView.snp.bottom).offset(-10)
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
