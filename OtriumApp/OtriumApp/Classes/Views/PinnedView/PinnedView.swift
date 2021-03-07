//
//  PinnedView.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

import UIKit

/* ==================================================
 Procols setup for Pinned view
 ================================================== */
protocol ItemsPinnedView: class {
    
    func loadRepository(_ repositoryModel: MainModel)
    func alertMessage(_ message: String)
    func activityIndicator(_ status: Bool)
}
class PinnedView: BaseView {

    var presenter: PinnedViewPresenter!
    
    var mainView = UIView()
    var userName = UILabel()
    var userLogin = UILabel()
    var userImage = UIImageView()
    
    var repositoryTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialLoad()
                
        presenter.loadRepositories(presenter.userModel?.login ?? "")
        updateUserInfo()
    }
    
    private func initialLoad() {
        setupUIControls()
    }

    /* ==================================================
     Used to update main data
     ================================================== */
    private func updateUserInfo() {
        configureImage(presenter.userModel?.avatarUrl!, userImage)
        userName.text = presenter.userModel?.name
        userLogin.text = presenter.userModel?.login
    }

}

/* ==================================================
 protocol section used in Pinned View
 ================================================== */
extension PinnedView: ItemsPinnedView {
    /* ==================================================
     Reload tabelview after the successful response
     ================================================== */
    func loadRepository(_ repositoryModel: MainModel) {
        DispatchQueue.main.async {
            self.repositoryTable.reloadData()
        }
    }
    /* ==================================================
     Nortify user for any issues
     ================================================== */
    func alertMessage(_ message: String) {
        let alert = UIAlertController(title: Constant.App.APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /* ==================================================
     Used to show any indicator
     ================================================== */
    func activityIndicator(_ status: Bool) {
        if status {
            self.startAnimating()
        }else{
            self.stopAnimating()
        }
    }
}

/* ==================================================
 Tableview configuration sections
 ================================================== */
extension PinnedView {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repositoryModel?.pinnedItems?.edges.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PinnedCell.identifier) as! PinnedCell
        cell.userModel = presenter.userModel
        cell.pinnedModel = presenter.repositoryModel?.pinnedItems?.edges[indexPath.row].node
        return cell
    }
}
