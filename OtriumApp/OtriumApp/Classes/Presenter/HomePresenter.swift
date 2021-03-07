//
//  HomePresenter.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import UIKit
import Apollo

/* ==================================================
 protocol setup for Home presenter
 ================================================== */
protocol HomeViewPresenter: class {
    init(view: ItemsHomeView)
    
    var userModel : UserModel? {get set}
    
    func viewDidLoad()
    func loadUserData()
    func setupPinnedHeader() -> UIView
    func setupTopCellHeader() -> UIView
    func setupStarredCellHeader() -> UIView
    func headerHeight () -> CGFloat
    
    func showAlertMessage(_ message: String)
    func showIndicator(_ status: Bool)
    
    func showPinnedView()
    //func showRepositoryView()
    
    func selectedRow(_ row: Int)
}

class HomePresenter: HomeViewPresenter {
    
    var userModel: UserModel?
    
    weak var view: ItemsHomeView?
    
    required init(view: ItemsHomeView) {
        self.view = view
    }
    
    func viewDidLoad() {
        loadUserData()
    }
    
    /* ==================================================
     Used to fetch user profile deta
     ================================================== */
    func loadUserData () {
        showIndicator(true)
        Network.shared.apollo.fetch(query: UserProfileQuery()) { result in
            self.showIndicator(false)
            switch result {
                case .success(let graphQLResult):
                    if let item = graphQLResult.data?.user {
                        let json = item.jsonObject
                        let myData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
                        let userValueData = try? JSONDecoder().decode(UserModel.self, from: myData)
                        DispatchQueue.main.async {
                            self.userModel = userValueData
                            if let userModel = self.userModel {
                                self.view?.loadProfile(userModel)
                            }else{
                                self.showAlertMessage("Please try again")
                            }
                        }
                    }else {
                        self.showAlertMessage("Invalid profile")
                    }
                case .failure(let error):
                    print("Failure! Error: \(error)")
                    self.showAlertMessage("Please try again")
            }
        }
    }
    
    /* ==================================================
     Used to show alert message
     ================================================== */
    func showAlertMessage(_ message: String) {
        view?.alertMessage(message)
    }
    
    /* ==================================================
     Used to show indicator view for long run taks
     ================================================== */
    func showIndicator(_ status: Bool) {
        view?.activityIndicator(status)
    }
    
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
     Used to setup header heigh
     ================================================== */
    func headerHeight () -> CGFloat {
        return 50
    }
    
    /* ==================================================
     Use when ViewAll tapped in Pinned
     ================================================== */
    private func viewAllPinnedClicked(_ success: Bool) {
        if success {
            showPinnedView()
        }
    }
    
    /* ==================================================
     Used to navigate to View All Pinned repositories
     ================================================== */
    func showPinnedView() {
        let pinnedView = PinnedView()
        let presenter = PinnedPresenter(view: pinnedView)
        presenter.userModel = userModel
        pinnedView.presenter = presenter
        
        Utility.Common.showDestination(view as! UIViewController, pinnedView)
    }
    
    /* ==================================================
     Used to show single repositories.
     Eg. Type - (1 - Pinned, 2 - Top repository, 3 - Starred Repository)
     ================================================== */
    func showRepositoryView(_ row: Int, _ type: Int) {
        let repoView = RepositoryView()
        let presenter = RepositoryPresenter(view: repoView)
        presenter.userModel = userModel
        repoView.presenter = presenter
        presenter.rowID = row
        presenter.type = type
        
        Utility.Common.showDestination(view as! UIViewController, repoView)
    }
    
    /* ==================================================
     Use this func as common for selected Cell (Pinned item, Top repository and Starred repository)
     Eg. Item - (1 - Pinned, 2 - Top repository, 3 - Starred Repository)
     ================================================== */
    func selectedRow(_ row: Int) {
        //let pinnedMode = userModel?.pinnedItems?.edges[row]
        
        showRepositoryView(row, 1)
    }
    
    
    
}
