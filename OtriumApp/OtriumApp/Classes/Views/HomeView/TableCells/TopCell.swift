//
//  TopCell.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit

class TopCell: BaseCell {

    static let identifier = "topCell"
    
    var topCollection: UICollectionView!
    
    var userModel: UserModel? {
        didSet{
            topCollection.reloadData()
        }
    }
    
    /* ==================================================
     Need to override this method to load UI setup
     ================================================== */
    override func setupCellViews() {
        topCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        setupUIControls()
        
    }
}

extension TopCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userModel?.topRepositories?.nodes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollectionCell.identifier, for: indexPath) as! TopCollectionCell
        
        cell.setupCellView()
        cell.userModel = userModel
        cell.topRepository = userModel?.topRepositories?.nodes?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize: CGSize
        cellSize = CGSize(width: 300, height: 200)
        return cellSize
    }
    
}

