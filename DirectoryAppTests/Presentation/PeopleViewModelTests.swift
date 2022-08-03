//
//  PeopleViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Ravali on 03/08/22.
//

import XCTest
@testable import DirectoryApp

class PeopleViewModelTests: XCTestCase {

    var viewModel:PeopleViewModel!
    let peopleUseCase = MokcPeopleUseCase()

    override func setUpWithError() throws {
       
        let coordinator =  AppCoordinator(navController: UINavigationController())
        
        
        viewModel = PeopleViewModel(peopleUseCase: peopleUseCase, coordinator: coordinator)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // get People success
    func testWhenGetPeopleIsSuccess() async {
        
        //GIVEN :
        peopleUseCase.enqueuePeopelesRecords(peoplesRecords: [PeopleRecord(firstName:"test", avatar: "test", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
        // When
        await viewModel.getPeoples()

        // Then
        XCTAssertEqual(viewModel.state, .showPeopleView)
        
    }
    
    
    // getPeople Failed
    func testWhenGetPeopleIsFailed() async {
        
        //GIVEN : People UseCase has nil records
      
        // When
         await viewModel.getPeoples()

        XCTAssertEqual(viewModel.state, .showError(APIError.invalidData.localizedDescription))
    }
    
    
    // get downLoad image success
    func testGetPeopleAvatarIsSuccess() async {
        
        //GIVEN :
        peopleUseCase.enqueuePeopelesRecords(peoplesRecords: [PeopleRecord(firstName:"test", avatar: "valid", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
        
        await viewModel.getPeoples()

        
        // When
         viewModel.getPeopleImage(for:0, completion: { imageData in
            // Then
            XCTAssertNotNil(imageData)
        })
    }
    
    
    // get downLoad image failed
    func testGetPeopleAvatarIsFailure() async {
        
        //GIVEN :
        peopleUseCase.enqueuePeopelesRecords(peoplesRecords: [PeopleRecord(firstName:"test", avatar: "invalid", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
        
        await viewModel.getPeoples()

        
        // When
         viewModel.getPeopleImage(for:0, completion: { imageData in
            // Then
            XCTAssertNil(imageData)
        })
    }
    
}
