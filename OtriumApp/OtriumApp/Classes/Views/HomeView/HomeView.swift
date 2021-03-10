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
    
    lazy var mainView: UIView = UILabel.mainView()
    lazy var cellName: UILabel = UILabel.profileName()
    lazy var cellLogin: UILabel = UILabel.profileLogin()
    lazy var cellEmail: UILabel = UILabel.profileEmail()
    lazy var cellImage: UIImageView = UIImageView.profileImage()
    lazy var cellFollowers: UILabel = UILabel.profileFollowers()
    lazy var cellFollowing: UILabel = UILabel.profileFollowing()


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
    
    /* ==================================================
     Used to update profile data
     ================================================== */
    func updateProfile() {
        configureImage(userModel?.avatarUrl!, cellImage)
        cellName.text = userModel?.name
        cellLogin.text = userModel?.login
        cellEmail.text = userModel?.email
        cellFollowers.text = "\(userModel?.followers?.totalCount ?? 0) Followers"
        cellFollowing.text = "\(userModel?.following?.totalCount ?? 0) Following"
    }
  
}

extension HomeView {
    /* ==================================================
     Used to setup pinned cell header
     ================================================== */
    func setupPinnedHeader() -> UIView  {
        let pinnedHeader = PinnedCellHeader()
        pinnedHeader.initHeader()
        pinnedHeader.headerTitle.text = "Pinned"
        pinnedHeader.moreButton.setTitle("View All", for: .normal)
        
        pinnedHeader.moreButtonClosure = viewAllPinnedClicked
        
        return pinnedHeader
    }
    
    /* ==================================================
     Used to setup top Repository header
     ================================================== */
    func setupTopCellHeader() -> UIView {
        let pinnedHeader = PinnedCellHeader()
        pinnedHeader.initHeader()
        pinnedHeader.headerTitle.text = "Top Repositories"
        pinnedHeader.moreButton.setTitle("View All", for: .normal)
        return pinnedHeader
    }
    
    /* ==================================================
     Used to setup strarred repository header
     ================================================== */
    func setupStarredCellHeader() -> UIView {
        let pinnedHeader = PinnedCellHeader()
        pinnedHeader.initHeader()
        pinnedHeader.headerTitle.text = "Starred Repositories"
        pinnedHeader.moreButton.setTitle("View All", for: .normal)
        return pinnedHeader
    }
    
    /* ==================================================
     Use when ViewAll tapped in Pinned
     ================================================== */
    private func viewAllPinnedClicked(_ success: Bool) {
        if success {
            presenter.showPinnedView()
        }
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
            print("")
        case 2:
            print("")
        default:
            presenter.selectedRow(indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            return setupTopCellHeader()
        case 2:
            return setupStarredCellHeader()
        default:
            return setupPinnedHeader()
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= -50.0 || currentOffset <= -50 {
            presenter.refreshUserData()
        }
        
    }
    
}
