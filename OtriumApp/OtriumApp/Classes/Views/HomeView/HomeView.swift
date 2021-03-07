//
//  HomeView.swift
//  OtriumApp
//
//  Created by Rizvi on 3/5/21.
//

import UIKit

/* ==================================================
 Procols setup for Home view
 ================================================== */
protocol ItemsHomeView: class {
    func loadProfile(_ userModel: UserModel)
    func alertMessage(_ message: String)
    func activityIndicator(_ status: Bool)
}

class HomeView: BaseView {
    
    var presenter: HomeViewPresenter!
    
    var profileTable = UITableView()
    
    var userModel: UserModel?
    
    var mainView = UIView()
    var cellName = UILabel()
    var cellDescription = UILabel()
    var cellEmail = UILabel()
    var cellImage = UIImageView()
    var cellFollowers = UILabel()
    var cellFollowing = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initialLoad()

        presenter.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    /* ==================================================
     Initial load items
     ================================================== */
    private func initialLoad() {
        setupUIControls()
    }
    
    func updateProfile() {
        configureImage(userModel?.avatarUrl!, cellImage)
        cellName.text = userModel?.name
        cellDescription.text = userModel?.login
        cellEmail.text = userModel?.email
        cellFollowers.text = "\(userModel?.followers?.totalCount ?? 0) Followers"
        cellFollowing.text = "\(userModel?.following?.totalCount ?? 0) Following"
    }
  
}


extension HomeView: ItemsHomeView {
    /* ==================================================
     Reload table after data is fetched
     ================================================== */
    func loadProfile(_ userModel: UserModel) {
        self.userModel = userModel
        profileTable.reloadData()
        self.updateProfile()
    }
    
    func alertMessage(_ message: String) {
        let alert = UIAlertController(title: Constant.App.APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func activityIndicator(_ status: Bool) {
        if status {
            self.startAnimating()
        }else{
            self.stopAnimating()
        }
    }
}

extension HomeView{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 1
        case 2:
            return 1
        default:
            return presenter.userModel?.pinnedItems?.edges.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section)
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopCell.identifier) as! TopCell
            cell.userModel = presenter.userModel
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: StarredCell.identifier) as! StarredCell
            cell.userModel = presenter.userModel
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: PinnedCell.identifier) as! PinnedCell
            cell.userModel = presenter.userModel
            cell.pinnedModel = presenter.userModel?.pinnedItems?.edges[indexPath.row].node
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            print("hi")
        case 2:
            print("hi")
        default:
            presenter.selectedRow(indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            return presenter.setupTopCellHeader()
        case 2:
            return presenter.setupStarredCellHeader()
        default:
            return presenter.setupPinnedHeader()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1 :
            return presenter.headerHeight()
        case 2:
            return presenter.headerHeight()
        default:
            return presenter.headerHeight()
        }
    }
    
}
