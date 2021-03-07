//
//  StarredCell+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import SwiftHEXColors
import SnapKit

extension StarredCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupUIControls () {
        self.removeObjects()
        self.setupUI()
        
        contentView.addSubview(starredCollection)

        self.setupUIConstraints()
    }
    
    private func setupUI() {
        self.starredCollection = {
            var colView: UICollectionView!
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            //colView.setCollectionViewLayout(layout, animated: true)
            //layout.itemSize = CGSize(width: 50, height: 100)
            layout.scrollDirection = .horizontal
            //colView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            colView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: layout)
            colView.showsHorizontalScrollIndicator = false
            colView.delegate = self
            colView.dataSource = self
            colView.register(StarredCollectionCell.self, forCellWithReuseIdentifier: StarredCollectionCell.identifier)
            //colView.backgroundColor = UIColor(hexString: Constant.colors.APP_GREEN_BACKGROUND)
            colView.backgroundColor = .clear
            return colView
        }()
      
    }
        
    private func setupUIConstraints () {
        self.starredCollection.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(200)
        }
       
    
    }
    
    private func removeObjects(){
        starredCollection.removeFromSuperview()
    }
        

}
