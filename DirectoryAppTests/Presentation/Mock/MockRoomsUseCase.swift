//
//  MockRoomsUseCase.swift
//  DirectoryAppTests
//
//  Created by Ravali on 03/08/22.
//

import Foundation
import XCTest
@testable import DirectoryApp


class MockRoomsUseCase: RoomsUseCase {
    var roomsRecords: [RoomRecord]?
    
   func execute() async throws -> [RoomRecord] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    
    func enqueueRoomsRecords(roomsRecords: [RoomRecord]) {
        self.roomsRecords = roomsRecords
    }
}

