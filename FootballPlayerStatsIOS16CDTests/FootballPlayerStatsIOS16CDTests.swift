//
//  FootballPlayerStatsIOS16CDTests.swift
//  FootballPlayerStatsIOS16CDTests
//
//  Created by Michael Potts on 6/26/22.
//

import XCTest
@testable import FootballPlayerStatsIOS16CD

final class FootballPlayerStatsIOS16CDTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_GameDataModel_CountOfGames_ShouldBeTwo() {
        let gameDM = GameDataModel(isTesting: true)
        
        let gamesCount = gameDM.games.count
        
        XCTAssertEqual(gamesCount, 2)
    }
    
    func test_GameDataModel_TotalMinutesPlayed_ShouldBe_119() {
        let gameDM = GameDataModel(isTesting: true)
        
        let totalMinutesPlayed = gameDM.computeSumFor(.minutesPlayed)
        
        XCTAssertEqual(totalMinutesPlayed, 119)
    }
    
    func test_GameDataModel_TeamRecord_ShouldBe_1_1_0() {
        let gameDM = GameDataModel(isTesting: true)
        
        let (wins, losses, draws) = gameDM.computeRecord()
        
        XCTAssertEqual(wins, 1)
        XCTAssertEqual(losses, 1)
        XCTAssertEqual(draws, 0)
    }
    
    func test_GameDataModel_HighlightGame_GameIsHighlight() {
        let gameDM = GameDataModel(isTesting: true)
        
        let gameOneHighlightStatus = gameDM.games[0].highlightGame
        
        XCTAssertTrue(gameOneHighlightStatus)
    }
    
    func test_GameDataModel_HighlightGame_HighlightIsToggled() {
        let gameDM = GameDataModel(isTesting: true)
        
        gameDM.toggleHighlightFlag(for: gameDM.games[0])
        let gameOneHighlightStatus = gameDM.games[0].highlightGame
        
        XCTAssertFalse(gameOneHighlightStatus)
    }


}
