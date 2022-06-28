//
//  FootballPlayerStatsIOS16CDTests.swift
//  FootballPlayerStatsIOS16CDTests
//
//  Created by Michael Potts on 6/26/22.
//

import XCTest
@testable import FootballPlayerStatsIOS16CD

final class FootballPlayerStatsIOS16CDTests: XCTestCase {
    
    var gameDM: GameDataModel!
    
    override func setUp() {
        gameDM = GameDataModel(isTesting: true)
    }
    
    override func tearDown() {
        gameDM = nil
    }

    func test_GameDataModel_CountOfGames_ShouldBeThree() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let gamesCount = gameDM.games.count
        
        XCTAssertEqual(gamesCount, 3)
    }
    
    func test_GameDataModel_TotalMinutesPlayed_ShouldBe_193() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let totalMinutesPlayed = gameDM.computeSumFor(.minutesPlayed)
        
        XCTAssertEqual(totalMinutesPlayed, 193)
    }
    
    func test_GameDataModel_PerGameAverage_ShouldBe64_33() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let minutesPerGame = gameDM.computeAvgPerGame(for: .minutesPlayed)
        
        XCTAssertEqual(minutesPerGame, "64.33")
    }
    
    func test_GameDataModel_TeamRecord_ShouldBe_1_1_1() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let (wins, losses, draws) = gameDM.computeRecord()
        
        XCTAssertEqual(wins, 1)
        XCTAssertEqual(losses, 1)
        XCTAssertEqual(draws, 1)
    }
    
    func test_GameDataModel_HighlightGame_GameIsHighlight() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let gameOneHighlightStatus = gameDM.games[0].highlightGame
        
        XCTAssertTrue(gameOneHighlightStatus)
    }
    
    func test_GameDataModel_HighlightGame_HighlightIsToggled() {
//        let gameDM = GameDataModel(isTesting: true)
        
        gameDM.toggleHighlightFlag(for: gameDM.games[0])
        let gameOneHighlightStatus = gameDM.games[0].highlightGame
        
        XCTAssertFalse(gameOneHighlightStatus)
    }

}
