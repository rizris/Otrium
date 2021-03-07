//
//  HomeViewTests.swift
//  OtriumAppTests
//
//  Created by Rizvi on 3/6/21.
//

import XCTest

@testable import OtriumApp


class HomeViewTests: XCTestCase {

    var userModel : UserModel?

    var presenter: HomeViewPresenter!
    
    var homeView: HomeView!
    
    
    override func setUpWithError() throws {
        homeView = HomeView()
        presenter = HomePresenter(view: homeView)
        homeView.presenter = presenter
        
        let folloers = Followers(totalCount: 10)
        let following = Following(totalCount: 10)
        
        
        let pinLanguage = PinnedLanguage(name: "pinJava")
        let pinnedModel =  PinndedModel(name: "pinname", description: "pindescription", forkCount: 20, openGraphImageUrl: "pinurl", primaryLanguage: pinLanguage)
        let edges = Edges(node: pinnedModel)
        
        let pinLanguage1 = PinnedLanguage(name: "pinJava-1")
        let pinnedModel1 =  PinndedModel(name: "pinname-1", description: "pindescription-1", forkCount: 20, openGraphImageUrl: "pinurl-1", primaryLanguage: pinLanguage1)
        let edges1 = Edges(node: pinnedModel1)

        let pinLanguage2 = PinnedLanguage(name: "pinJava-2")
        let pinnedModel2 =  PinndedModel(name: "pinname-2", description: "pindescription-2", forkCount: 20, openGraphImageUrl: "pinurl-2", primaryLanguage: pinLanguage2)
        let edges2 = Edges(node: pinnedModel2)

        let pinned = Pinned(edges: [edges, edges1, edges2])
        
        
        let topLanguage = TopLanguage(name: "toplanguage")
        let topRepository = TopRepository(name: "topname", description: "topdescription", forkCount: 20, openGraphImageUrl: "topurl", primaryLanguage: topLanguage)
        let topRepo = TopRepo(nodes: [topRepository])
        
        
        let starredLanguage = StarredLanguage(name: "starredlanguage")
        let starredRepository = StarredRepository(name: "starredname", description: "starreddescription", forkCount: 30, openGraphImageUrl: "starredurl", primaryLanguage: starredLanguage)
        let starredRepo = StarredRepo(nodes: [starredRepository])
        
        userModel = UserModel(name: "John", login: "testjohn", email: "test@gmail.com", avatarUrl: "url", followers: folloers, following: following, pinnedItems: pinned, topRepositories: topRepo, starredRepositories: starredRepo)

        presenter.userModel = userModel
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    /* ==================================================
     Test homeview Has Profile table
     ================================================== */
    func testUserProfileDetails() {
        let userName = self.userModel?.name
        let presenterUsername = self.presenter.userModel?.name
        
        XCTAssertEqual(userName, presenterUsername, "John")
        
        XCTAssertEqual(userModel?.login, presenter.userModel?.login, "login name should be testjohn")
        XCTAssertEqual(userModel?.email, presenter.userModel?.email, "login name should be test@gmail.com")
    }
    
    /* ==================================================
     Test number of pinned repositories
     ================================================== */
    func testNumberofPinnedRepository() {
        let count = self.userModel?.pinnedItems?.edges.count
        let pinnedRepoCount = self.presenter.userModel?.pinnedItems?.edges.count
        
        XCTAssertEqual(count, pinnedRepoCount, "The count should be 2")
    }
    
    /* ==================================================
     Test number of top repositories
     ================================================== */
    func testNumberofTopRepository() {
        let count = self.userModel?.topRepositories?.nodes?.count
        let topRepositoriesCount = self.presenter.userModel?.topRepositories?.nodes?.count
        
        XCTAssertEqual(count, topRepositoriesCount, "The count should be 1")
    }
    
    /* ==================================================
     Test number of starred repositories
     ================================================== */
    func testNumberofStarredRepository() {
        let count = self.userModel?.starredRepositories?.nodes?.count
        let starredRepositoriesCount = self.presenter.userModel?.starredRepositories?.nodes?.count
        
        XCTAssertEqual(count, starredRepositoriesCount, "The count should be 1")
    }
    
    
    /* ==================================================
     Test homeview Has Profile table
     ================================================== */
    func testTopRepositoryDetails() {
        let userModel = self.userModel?.topRepositories?.nodes?[0]
        let repositoryModel = self.presenter.userModel?.topRepositories?.nodes?[0]
        
        XCTAssertEqual(userModel?.name, repositoryModel?.name, "The name should be topname")
        XCTAssertEqual(userModel?.description, repositoryModel?.description, "The name should be topdescription")
        XCTAssertEqual(userModel?.forkCount, repositoryModel?.forkCount, "The name should be 20")
    }
    
    /* ==================================================
     Test homeview Has Profile table
     ================================================== */
    func testStarredRepositoryDetails() {
        let userModel = self.userModel?.starredRepositories?.nodes?[0]
        let starredModel = self.presenter.userModel?.starredRepositories?.nodes?[0]
        
        XCTAssertEqual(userModel?.name, starredModel?.name, "The name should be starredname")
        XCTAssertEqual(userModel?.description, starredModel?.description, "The name should be topdescription")
        XCTAssertEqual(userModel?.forkCount, starredModel?.forkCount, "The name should be 30")
    }
    
    
    /* ==================================================
     Test Table header height
     ================================================== */
    func testHeaderHeight () {
        let headerHeight = presenter.headerHeight()
        XCTAssertEqual(50, headerHeight, "Header height should be 50")
    }
    
  
    
    
    /* ==================================================
     Test homeview Has Profile table
     ================================================== */
    func testHasATableView() {
        XCTAssertNotNil(homeView.profileTable, "Profile table should exist")
    }
    
    /* ==================================================
     Test number of rows Pinned repository
     ================================================== */
    func testTableRowsForPinned(){
        let tableView = homeView.profileTable
        
        let numberOfRows = homeView.tableView(tableView, numberOfRowsInSection: 0)
            XCTAssertEqual(numberOfRows, 3,"Number of rows in table should match to 2")
    }
    
    /* ==================================================
     Test number of rows in Top repository
     ================================================== */
    func testTableRowsForTopRepositories(){
        let tableView = homeView.profileTable
        
        let numberOfRows = homeView.tableView(tableView, numberOfRowsInSection: 1)
            XCTAssertEqual(numberOfRows, 1,"Number of rows in table should match to 1")
    }
    
    /* ==================================================
     Test number of rows in Starred Repository
     ================================================== */
    func testTableRowsForStarredRepositories(){
        let tableView = homeView.profileTable
        
        let numberOfRows = homeView.tableView(tableView, numberOfRowsInSection: 2)
            XCTAssertEqual(numberOfRows, 1,"Number of rows in table should match to 1")
    }
    
    /* ==================================================
     Test Pinned table cell
     ================================================== */
    func testPinnedCellRow() {
        let tableView = homeView.profileTable

        tableView.register(PinnedCell.self, forCellReuseIdentifier: PinnedCell.identifier)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = homeView.tableView(tableView, cellForRowAt: indexPath) as! PinnedCell
        
        XCTAssertEqual(cell.cellName.text, "pinname",
                       "The cell name should display pinname")
    }
    
    /* ==================================================
     Test number of items in Top repository collection
     ================================================== */
    func testCollectionNumberOfRowForTopRepository() {
        let tableView = homeView.profileTable
        
        tableView.register(TopCell.self, forCellReuseIdentifier: TopCell.identifier)
        let indexPath = IndexPath(row: 0, section: 1)
        
        let cell = homeView.tableView(tableView, cellForRowAt: indexPath) as! TopCell
            
        let numberOfItems = cell.collectionView(cell.topCollection, numberOfItemsInSection: 0)
        
        XCTAssertEqual(1, numberOfItems, "The cell name should display pinname")
    }
    
    /* ==================================================
     Test number of items in Starred Repository collection
     ================================================== */
    func testCollectionNumberOfRowForStarredRepository() {
        let tableView = homeView.profileTable
        
        tableView.register(StarredCell.self, forCellReuseIdentifier: StarredCell.identifier)
        let indexPath = IndexPath(row: 0, section: 2)
        
        let cell = homeView.tableView(tableView, cellForRowAt: indexPath) as! StarredCell
            
        let numberOfItems = cell.collectionView(cell.starredCollection, numberOfItemsInSection: 0)
        
        XCTAssertEqual(1, numberOfItems, "The cell name should display pinname")
    }
    
    /* ==================================================
     Test Top repository collection cell
     ================================================== */
    func testTopRepositoryCollectionCellRow() {
        let tableView = homeView.profileTable

        tableView.register(TopCell.self, forCellReuseIdentifier: TopCell.identifier)
        
        let indexPath = IndexPath(row: 0, section: 1)
        let cell = homeView.tableView(tableView, cellForRowAt: indexPath) as! TopCell
        
        let indexPathCollection = IndexPath(row: 0, section: 0)
        let collectionCell = cell.collectionView(cell.topCollection, cellForItemAt: indexPathCollection) as! TopCollectionCell
        
        XCTAssertEqual(collectionCell.cellName.text, "topname", "The cell name should display topname")
    }
    
    /* ==================================================
     Test starred repository collection cell
     ================================================== */
    func testStarredRepositoryCollectionCellRow() {
        let tableView = homeView.profileTable

        tableView.register(StarredCell.self, forCellReuseIdentifier: StarredCell.identifier)
        
        let indexPath = IndexPath(row: 0, section: 2)
        let cell = homeView.tableView(tableView, cellForRowAt: indexPath) as! StarredCell
        
        let indexPathCollection = IndexPath(row: 0, section: 0)
        let collectionCell = cell.collectionView(cell.starredCollection, cellForItemAt: indexPathCollection) as! StarredCollectionCell
        
        XCTAssertEqual(collectionCell.cellName.text, "starredname", "The cell name should display starredname")
    }
    

}
