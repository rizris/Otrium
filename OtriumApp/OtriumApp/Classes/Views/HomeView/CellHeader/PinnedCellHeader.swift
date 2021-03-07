//
//  PinnedCellHeader.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit

class PinnedCellHeader: UIView {
    
    var headerTitle = UILabel()
    var moreButton = UIButton()
    
    var moreButtonClosure:((Bool) ->())?
    
    func initHeader ()  {
        setupUIControls()
        
        self.backgroundColor = UIColor.white
        
        moreButton.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
    }
    
    @objc func moreButtonAction () {
        moreButtonClosure?(true)
    }
    
}

extension PinnedCellHeader {
    private func setupUIControls () {
        self.removeUIObjects()
        self.setupUI()
        
        self.addSubview(headerTitle)
        self.addSubview(moreButton)
        
        self.setupConstraints()
    }
    private func setupUI() {
        self.headerTitle = {
            let label = UILabel()
            label.fontTitleColorNoBackground()
            return label
        }()
        self.moreButton = {
            let button = UIButton()
            button.setTitle("View All", for: .normal)
            button.setupFontAndColor()
            button.makeRightAlignment()
            return button
        }()
        
    }
    
    private func setupConstraints (){
        self.headerTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.left.equalTo(self.snp.left).offset(20)
            make.height.equalTo(30)
        }
        self.moreButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.left.equalTo(headerTitle.snp.right).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.height.equalTo(headerTitle)
            make.width.equalTo(150)
        }
        
    }
    
    private func removeUIObjects(){
        self.headerTitle.removeFromSuperview()
        self.moreButton.removeFromSuperview()
    }
    
}

