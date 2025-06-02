//
//  Dino_BestiaryUITests.swift
//  Dino BestiaryUITests
//
//  Created by Renan Maganha on 26/05/25.
//

import XCTest

final class Dino_BestiaryUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    @MainActor
    func test_toggle_display_type() throws {
        let raptorID = "f64a41d7-1d99-4d89-8a62-1e57012d2320"
        let raptorListCell = app.buttons[AccessibilityID.dinoCell(raptorID, displayType: .list)]
        XCTAssertTrue(raptorListCell.exists)
        
        let toggleButton = app.buttons[AccessibilityID.toggleDisplayButton]
        XCTAssertTrue(toggleButton.exists)
        toggleButton.tap()
        
        let raptorGridCell = app.buttons[AccessibilityID.dinoCell(raptorID, displayType: .grid)]
        XCTAssertTrue(raptorGridCell.exists)
    }
    
    @MainActor
    func test_on_tap_list_cell_navigates_to_detail_view() throws {
        let raptorID = "f64a41d7-1d99-4d89-8a62-1e57012d2320"
        let raptorListCell = app.buttons[AccessibilityID.dinoCell(raptorID, displayType: .list)]
        XCTAssertTrue(raptorListCell.exists)
        
        raptorListCell.tap()
        
        let raptorDetailsView = app.scrollViews[AccessibilityID.dinoDetail(raptorID)]
        XCTAssertTrue(raptorDetailsView.exists)
    }
    
    @MainActor
    func test_on_tap_grid_cell_navigates_to_detail_view() throws {
        let toggleButton = app.buttons[AccessibilityID.toggleDisplayButton]
        toggleButton.tap()
        
        let raptorID = "f64a41d7-1d99-4d89-8a62-1e57012d2320"
        let raptorGridCell = app.buttons[AccessibilityID.dinoCell(raptorID, displayType: .grid)]
        XCTAssertTrue(raptorGridCell.exists)
        
        raptorGridCell.tap()
        
        let raptorDetailsView = app.scrollViews[AccessibilityID.dinoDetail(raptorID)]
        XCTAssertTrue(raptorDetailsView.exists)
    }

}
