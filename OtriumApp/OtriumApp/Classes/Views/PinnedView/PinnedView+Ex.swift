//
//  PinnedView+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

import UIKit
import SnapKit

extension PinnedView: UITableViewDelegate, UITableViewDataSource {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.isTranslucent = false
        self.title = "Pinned Repositories"
    }
    
    func setupUIControls () {
        removeObjects()
        setupUI()
        
        view.addSubview(mainView)
        mainView.addSubview(userName)
        mainView.addSubview(userLogin)
        mainView.addSubview(userImage)
        view.addSubview(repositoryTable)
        
        setupUIConstraints()
    }
    
    func setupUI () {
        self.mainView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 5
            return view
        }()
        self.userImage = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "girl")
            imgView.contentMode = .scaleAspectFit
            imgView.layer.cornerRadius = 40
            imgView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            imgView.clipsToBounds = true
            return imgView
        }()
        self.userName = {
            let label = UILabel()
            label.text = "kk"
            label.fontTitleColorNoBackground()
            return label
        }()
        self.userLogin = {
            let label = UILabel()
            label.text = "Roja"
            label.fontAndColorNoBackground()
            return label
        }()
        self.repositoryTable = {
            let tableView = UITableView()
            tableView.backgroundColor = UIColor(hexString: Constant.Colors.PRIMARY_WHITE)
            tableView.estimatedRowHeight = 50
            tableView.rowHeight = UITableView.automaticDimension
            tableView.showsVerticalScrollIndicator = false
            tableView.separatorStyle = .none
            tableView.allowsSelection = true
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(PinnedCell.self, forCellReuseIdentifier: PinnedCell.identifier)
            return tableView
        }()
    }
    func setupUIConstraints () {
        self.mainView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(0)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
        }
        self.userImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(10)
            make.left.equalTo(mainView.snp.left).offset(10)
            //make.trailing.equalTo(mainView.snp.trailing).offset(-10)
            make.height.width.equalTo(80)
            make.bottom.equalTo(mainView.snp.bottom).offset(-10)
        }
        self.userName.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(20)
            make.left.equalTo(userImage.snp.right).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(30)
        }
        self.userLogin.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(userName.snp.bottom).offset(0)
            make.left.equalTo(userImage.snp.right).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(userName)
            
        }
        self.repositoryTable.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(view).offset(0)
        }
      
    }
    func removeObjects () {
        mainView.removeFromSuperview()
        repositoryTable.removeFromSuperview()
    }

}
