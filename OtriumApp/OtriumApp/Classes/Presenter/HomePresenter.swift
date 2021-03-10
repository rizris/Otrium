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
    func headerHeight () -> CGFloat
    func showAlertMessage(_ message: String)
    func showIndicator(_ status: Bool)
    func showPinnedView()
    func selectedRow(_ row: Int?)
    func refreshUserData()
}

class HomePresenter: HomeViewPresenter {
    
    var userModel: UserModel?
    
    weak var view: ItemsHomeView?
    
    private(set) var cachePolicy: CachePolicy!
    
    private(set) var isWantServerRefresh : Bool = false

    required init(view: ItemsHomeView) {
        self.view = view
    }
    
    /* ==================================================
     Used to load initial items
     ================================================== */
    func viewDidLoad() {
        loadUserData("bertrandmartel")
    }
    
    /* ==================================================
     Used to get current time in Seconds
     ================================================== */
    func currentTime () -> Int {
        return Utility.DateSection.timeInSecond()
    }

    /* ==================================================
     Used to get Caching Start time
     ================================================== */
    func cachingStartTime() -> Int{
        if Utility.UserDefaultsSetup.getCachingTime() == 0 {
            updateCachingTime()
        }
        return Utility.UserDefaultsSetup.getCachingTime()
    }
    
    /* ==================================================
     Used to save new caching time
     ================================================== */
    func updateCachingTime() {
        Utility.UserDefaultsSetup.saveCachingTime()
    }
    
    /* ==================================================
     Used to get caching eding time in seconds
     ================================================== */
    func cachingEndTime() -> Int {
        let endingDate = Utility.DateSection.secondIntoDate(cachingStartTime())
        let endingTime = Utility.DateSection.timeInSecond(Utility.DateSection.findNextDay(endingDate))
        return endingTime
    }
    
    /* ==================================================
     Used to get Caching remaining time in hour / hours
     ================================================== */
    func remainingTimeInHour() -> Int{
        let hour = (cachingEndTime() - currentTime()) / 3600
        return hour
    }
    
    /* ==================================================
     Used to setup cache policy for the request
     ================================================== */
    private func setupCachePolicy() {
        if remainingTimeInHour() < 1 {
            updateCachePolicy(false)
            updateCachingTime()
        }else{
            updateCachePolicy(true)
        }
    }
    
    /* ==================================================
     Used to - Access the server
     ================================================== */
    func refreshUserData(){
        isWantServerRefresh = true
        viewDidLoad()
    }
    
    /* ==================================================
     Used to check want to access the server
     ================================================== */
    func checkActiveRefresh() {
        isWantServerRefresh ? updateCachePolicy(false) : setupCachePolicy()
    }
    
    /* ==================================================
     Used to update cachePolicy
     True - use cache data, False - Use server data
     ================================================== */
    func updateCachePolicy(_ isLocal: Bool = true) {
        isLocal ? (cachePolicy = .returnCacheDataElseFetch) : (cachePolicy = .fetchIgnoringCacheData)
        isWantServerRefresh = false
    }
    
    /* ==================================================
     Used to fetch user profile deta
     ================================================== */
    func loadUserData (_ login: String) {
        checkActiveRefresh()
        
        showIndicator(true)
        
        Network.shared.apollo.fetch(query: UserProfileQuery(login: login), cachePolicy: cachePolicy){[weak self] result in
            self?.showIndicator(false)
            switch result {
                case .success(let graphQLResult):
                    self?.successProfileQuery(graphQLResult)
                case .failure(let error):
                    self?.failedProfileQuery(error)
            }
        }
    }
    
    /* ==================================================
     Used to find Failed GraphQl query
     ================================================== */
    private func failedProfileQuery(_ error: Error) {
        showAlertMessage(error.localizedDescription)
    }
    
    /* ==================================================
     Used to find Successful query
     ================================================== */
    private func successProfileQuery(_ results: GraphQLResult<UserProfileQuery.Data>) {
        if let items = results.data?.user {
            let json = items.jsonObject
            let myData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let userValueData = try? JSONDecoder().decode(UserModel.self, from: myData)
            DispatchQueue.main.async {
                self.userModel = userValueData
                if let userModel = self.userModel {
                    self.view?.loadProfile(userModel)
                }else{
                    self.showAlertMessage(Constant.Message.TRY_AGAIN)
                }
            }
        }else {
            self.showAlertMessage(Constant.Message.INVALID_PROFILE)
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
     Used to setup header heigh
     ================================================== */
    func headerHeight () -> CGFloat {
        return 50
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
    func selectedRow(_ row: Int?) {
        if let row = row {
            showRepositoryView(row, 1)
        }
    }
    
    
    
}
