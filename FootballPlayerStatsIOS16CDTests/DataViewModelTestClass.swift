//
//  DataViewModelTestClass.swift
//  FootballPlayerStatsIOS16CDTests
//
//  Created by Michael Potts on 6/30/22.
//

import XCTest
@testable import FootballPlayerStatsIOS16CD

final class DataViewModelTestClass: XCTestCase {
    
    var dataVM: DataViewModel!

    override func setUp() {
        dataVM = DataViewModel(controller: MockedDataController())
    }

    override func tearDown() {
        dataVM = nil
    }

    func test_GameDataModel_CountOfGames_ShouldBeThree() {
        
        let gamesCount = dataVM.games.count
        
        XCTAssertEqual(gamesCount, 3)
    }
    
    func test_GameDataModel_TotalMinutesPlayed_ShouldBe_193() {
        
        let totalMinutesPlayed = dataVM.computeSumFor(.minutesPlayed)
        
        XCTAssertEqual(totalMinutesPlayed, 193)
    }
    
    func test_GameDataModel_PerGameAverage_ShouldBe64_33() {
        
        let minutesPerGame = dataVM.computeAvgPerGame(for: .minutesPlayed)
        
        XCTAssertEqual(minutesPerGame, "64.33")
    }
    
    func test_GameDataModel_TeamRecord_ShouldBe_1_1_1() {
        
        let (wins, losses, draws) = dataVM.computeRecord()
        
        XCTAssertEqual(wins, 1)
        XCTAssertEqual(losses, 1)
        XCTAssertEqual(draws, 1)
    }
    
    func test_GameDataModel_HighlightGame_GameIsHighlight() {
        
        let gameOneHighlightStatus = dataVM.games[0].highlightGame
        
        XCTAssertTrue(gameOneHighlightStatus)
    }
    
    func test_GameDataModel_HighlightGame_HighlightIsToggled() {
        
        dataVM.toggleHighlightFlag(for: dataVM.games[0])
        let gameOneHighlightStatus = dataVM.games[0].highlightGame
        
        XCTAssertFalse(gameOneHighlightStatus)
    }
    
    func test_DataViewModel_CalculatePercentage_ShouldBe85_42() {
        
        let passingAccuracy = dataVM.computePercentageFor(numerator: .passCompletions, denominator: .passAttempts)
        
        XCTAssertEqual(passingAccuracy, "85.42%")
    }
}
