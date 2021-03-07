//
//  RepositoryView+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

import UIKit
import SnapKit

extension RepositoryView {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.isTranslucent = false
        //self.title = "Profile"
    }
    
    func setupUIControls () {
        removeObjects()
        setupUI()
        
        view.addSubview(userImage)
        view.addSubview(userName)
        view.addSubview(userDescription)
        view.addSubview(userFork)
        view.addSubview(userLanguage)
        view.addSubview(imgStar)
        view.addSubview(imgCircle)
        
        setupUIConstraints()
    }
    
    func setupUI () {
        self.userImage = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "girl")
            //imgView.contentMode = .scaleAspectFill
            imgView.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
            //imgView.clipsToBounds = true
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
        self.userName = {
            let label = UILabel()
            label.text = "k"
            label.fontTitleColorNoBackground()
            return label
        }()
        self.userDescription = {
            let label = UILabel()
            label.text = "k"
            label.fontAndColorNoBackground()
            label.numberOfLines = 0
            return label
        }()
        self.userFork = {
            let label = UILabel()
            label.text = "k"
            label.fontAndColorNoBackground()
            return label
        }()
        self.userLanguage = {
            let label = UILabel()
            label.text = "k"
            label.fontAndColorNoBackground()
            return label
        }()
    }
    func setupUIConstraints () {
        self.userImage.snp.makeConstraints{ (make) -> Void in
            make.top.left.right.equalTo(view).offset(0)
            make.height.equalTo(view.frame.height / 3)
        }
        self.userName.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userImage.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(30)
        }
        self.userDescription.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userName.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.greaterThanOrEqualTo(30)
        }
        self.imgStar.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(userFork)
            make.left.equalTo(view.snp.left).offset(20)
            make.height.width.equalTo(15)
        }
        self.userFork.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userDescription.snp.bottom).offset(20)
            make.left.equalTo(imgStar.snp.right).offset(5)
            //make.right.equalTo(view.snp.right).offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        self.imgCircle.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(userLanguage)
            make.left.equalTo(userFork.snp.right).offset(20)
            make.height.width.equalTo(15)
        }
        self.userLanguage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userDescription.snp.bottom).offset(20)
            make.left.equalTo(imgCircle.snp.right).offset(5)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(userFork)
        }
      
    }
    func removeObjects () {
        userImage.removeFromSuperview()
        userName.removeFromSuperview()
        userDescription.removeFromSuperview()
        userFork.removeFromSuperview()
        userLanguage.removeFromSuperview()
        imgStar.removeFromSuperview()
        imgCircle.removeFromSuperview()

    }

}
