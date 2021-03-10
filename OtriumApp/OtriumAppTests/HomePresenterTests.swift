//
//  HomePresenterTests.swift
//  OtriumAppTests
//
//  Created by Rizvi on 3/9/21.
//

import XCTest
@testable import OtriumApp
import Apollo


class HomePresenterTests: XCTestCase {

    //var presenter: HomeViewPresenter!
    var presenter: HomePresenter!
    
    var homeView: HomeView!
    
    override func setUpWithError() throws {
        homeView = HomeView()
        //presenter = HomePresenter(view: homeView)
        //homeView.presenter = presenter
        
        presenter = HomePresenter(view: homeView)
    }

    override func tearDownWithError() throws {
        
    }

 
    func testCurrentTime() {
        let timeOne = presenter.currentTime()
        
        XCTAssertEqual(timeOne, Utility.DateSection.timeInSecond())
    }
    
    func testCaching_StartTime () {
        let cacheTime = presenter.cachingStartTime()
        
        XCTAssertEqual(cacheTime, Utility.UserDefaultsSetup.getCachingTime())
    }
    
    func testRemainingTimeToRefresh(){
        let endTime = presenter.cachingEndTime()
        let actualRemainingtime = (endTime - presenter.currentTime()) / 3600
        let remainingTime = presenter.remainingTimeInHour()
        
        XCTAssertEqual(actualRemainingtime, remainingTime)
    }
    
    func testRemainingTimeToRefresh_Failed(){
        let endTime = presenter.cachingEndTime()
        let actualRemainingtime = (endTime - presenter.currentTime())
        let remainingTime = presenter.remainingTimeInHour()
        
        XCTAssertNotEqual(actualRemainingtime, remainingTime)
    }
    
    func testCachePolicyFor_Local() {
        presenter.updateCachePolicy(true)
                
        XCTAssertEqual(presenter.cachePolicy, .returnCacheDataElseFetch)
    }
    
    func testCachePolicyFor_Server() {
        presenter.updateCachePolicy(false)
        
        XCTAssertEqual(presenter.cachePolicy, .fetchIgnoringCacheData)
    }
    
    func testCachePolicyFor_Server_Failed() {
        presenter.updateCachePolicy(true)
        
        XCTAssertNotEqual(presenter.cachePolicy, .fetchIgnoringCacheData)
    }
    
    func testCachePolicyFor_Local_Failed() {
        presenter.updateCachePolicy(false)
        
        XCTAssertNotEqual(presenter.cachePolicy, .returnCacheDataElseFetch)
    }
    
    func testCachePolicy_Success() {
        XCTAssertNil(presenter.cachePolicy)
        
    }
    
    func testIsWantServerRefresh() {
        XCTAssertFalse(presenter.isWantServerRefresh)
        
    }
    
    
    
}
