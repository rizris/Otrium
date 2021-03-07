//
//  HomeView+Ex.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import SnapKit

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.isTranslucent = false
        self.title = "Profile"
    }
    
    func setupUIControls () {
        removeObjects()
        setupUI()
        view.addSubview(profileTable)
        
        view.addSubview(mainView)
        //mainView.addSubview(profileTitle)
        mainView.addSubview(cellName)
        mainView.addSubview(cellDescription)
        mainView.addSubview(cellEmail)
        mainView.addSubview(cellImage)
        mainView.addSubview(cellFollowers)
        mainView.addSubview(cellFollowing)

        setupUIConstraints()
    }
    
    func setupUI () {
        self.mainView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 5
            return view
        }()
        self.cellImage = {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "girl")
            imgView.contentMode = .scaleAspectFit
            imgView.layer.cornerRadius = 40
            imgView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            imgView.clipsToBounds = true
            return imgView
        }()
        /*self.profileTitle = {
            let label = UILabel()
            label.text = "Profile"
            label.fontTitleColorNoBackground()
            label.textAlignment = .center
            return label
        }()*/
        self.cellName = {
            let label = UILabel()
            label.text = "Raja"
            label.fontTitleColorNoBackground()
            return label
        }()
        self.cellDescription = {
            let label = UILabel()
            label.text = "Roja"
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
        self.profileTable = {
            let tableView = UITableView()
            tableView.backgroundColor = UIColor(hexString: Constant.Colors.PRIMARY_WHITE)
            tableView.estimatedRowHeight = 50
            tableView.rowHeight = UITableView.automaticDimension
            tableView.showsVerticalScrollIndicator = false
            tableView.separatorStyle = .none
            tableView.allowsSelection = true
            tableView.dataSource = self
            tableView.delegate = self
            //tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
            tableView.register(PinnedCell.self, forCellReuseIdentifier: PinnedCell.identifier)
            tableView.register(TopCell.self, forCellReuseIdentifier: TopCell.identifier)
            tableView.register(StarredCell.self, forCellReuseIdentifier: StarredCell.identifier)
            return tableView
        }()
        
    }
    func setupUIConstraints () {
        self.mainView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(view.snp.top).offset(0)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
        }
        /*self.profileTitle.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(30)
            make.left.equalTo(mainView.snp.left).offset(10)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.height.equalTo(40)
        }*/
        self.cellImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.top).offset(10)
            make.left.equalTo(mainView.snp.left).offset(10)
            //make.trailing.equalTo(mainView.snp.trailing).offset(-10)
            make.height.width.equalTo(80)
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
        
        self.profileTable.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(view).offset(0)
        }
      
    }
    func removeObjects () {
        profileTable.removeFromSuperview()
    }

}
