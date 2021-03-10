//
//  StarredCell.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit

class StarredCell: BaseCell {

    static let identifier = "starredCell"
    
    var starredCollection: UICollectionView!
    
    var userModel: UserModel? {
        didSet{
            starredCollection.reloadData()
        }
    }

    /* ==================================================
     Need to override this method to load UI setup
     ================================================== */
    override func setupCellViews() {
        starredCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        setupUIControls()
        
    }

}

extension StarredCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userModel?.starredRepositories?.nodes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarredCollectionCell.identifier, for: indexPath) as! StarredCollectionCell
        
        cell.setupCellView()
        cell.userModel = userModel
        cell.starredRepository = userModel?.starredRepositories?.nodes?[indexPath.row]
        
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

