//
//  TopCell+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import SwiftHEXColors
import SnapKit

extension TopCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupUIControls () {
        self.removeObjects()
        self.setupUI()
        
        contentView.addSubview(topCollection)

        self.setupUIConstraints()
    }
    
    private func setupUI() {
        self.topCollection = {
            var colView: UICollectionView!
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            colView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: layout)
            colView.showsHorizontalScrollIndicator = false
            colView.delegate = self
            colView.dataSource = self
            colView.register(TopCollectionCell.self, forCellWithReuseIdentifier: TopCollectionCell.identifier)
            colView.backgroundColor = .clear
            return colView
        }()
      
    }
        
    private func setupUIConstraints () {
        self.topCollection.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(200)
        }
       
    
    }
    
    private func removeObjects(){
        topCollection.removeFromSuperview()
    }
        

}
