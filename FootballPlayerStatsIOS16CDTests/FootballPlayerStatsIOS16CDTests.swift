//
//  FootballPlayerStatsIOS16CDTests.swift
//  FootballPlayerStatsIOS16CDTests
//
//  Created by Michael Potts on 6/26/22.
//

import XCTest
@testable import FootballPlayerStatsIOS16CD

final class FootballPlayerStatsIOS16CDTests: XCTestCase {
    
    var dataVM: DataViewModel!
    
    override func setUp() {
        dataVM = DataViewModel(controller: MockedDataController())
    }
    
    override func tearDown() {
        dataVM = nil
    }

    func test_GameDataModel_CountOfGames_ShouldBeThree() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let gamesCount = dataVM.games.count
        
        XCTAssertEqual(gamesCount, 3)
    }
    
    func test_GameDataModel_TotalMinutesPlayed_ShouldBe_193() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let totalMinutesPlayed = dataVM.computeSumFor(.minutesPlayed)
        
        XCTAssertEqual(totalMinutesPlayed, 193)
    }
    
    func test_GameDataModel_PerGameAverage_ShouldBe64_33() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let minutesPerGame = dataVM.computeAvgPerGame(for: .minutesPlayed)
        
        XCTAssertEqual(minutesPerGame, "64.33")
    }
    
    func test_GameDataModel_TeamRecord_ShouldBe_1_1_1() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let (wins, losses, draws) = dataVM.computeRecord()
        
        XCTAssertEqual(wins, 1)
        XCTAssertEqual(losses, 1)
        XCTAssertEqual(draws, 1)
    }
    
    func test_GameDataModel_HighlightGame_GameIsHighlight() {
//        let gameDM = GameDataModel(isTesting: true)
        
        let gameOneHighlightStatus = dataVM.games[0].highlightGame
        
        XCTAssertTrue(gameOneHighlightStatus)
    }
    
    func test_GameDataModel_HighlightGame_HighlightIsToggled() {
//        let gameDM = GameDataModel(isTesting: true)
        
        dataVM.toggleHighlightFlag(for: dataVM.games[0])
        let gameOneHighlightStatus = dataVM.games[0].highlightGame
        
        XCTAssertFalse(gameOneHighlightStatus)
    }

}
