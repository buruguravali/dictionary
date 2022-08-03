//
//  RoomsViewModelTests.swift
//  DirectoryAppTests
//
//  Created by MAC on 18/07/22.
//

import XCTest
@testable import DirectoryApp


class RoomsViewModelTests: XCTestCase {

    var viewModel:RoomsViewModel!
    let roomsUseCase = MockRoomsUseCase()

    override func setUpWithError() throws {
       
        let coordinator =  AppCoordinator(navController: UINavigationController())

        viewModel = RoomsViewModel(roomsUseCase: roomsUseCase, coordinator: coordinator)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // get rooms success
    func testWhenGetRoomsIsSuccess() async {
        
        //GIVEN :
        roomsUseCase.enqueueRoomsRecords(roomsRecords: [RoomRecord(createdAt:"test", occupiedMessage: "occupied", maxOccupancy: 5, id: "1")])
        // When
        await viewModel.getRooms()

        // Then
        XCTAssertEqual(viewModel.state, .showRoomsView)
        
        let room = viewModel.getRooms(for: 0)

        XCTAssertEqual(room.maxOccupancy, 5)
        XCTAssertEqual(room.occupiedMessage, "occupied")

    }
    
    
    // getRooms Failed
    func testWhenGetPeopleIsFailed() async {
        
        //GIVEN : Room UseCase has nil records
      
        // When
         await viewModel.getRooms()

        XCTAssertEqual(viewModel.state, .showError(APIError.invalidData.localizedDescription))
        
    }
}

