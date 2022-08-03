//
//  MockRoomRepository.swift
//  DirectoryAppTests
//
//  Created by MAC on 18/07/22.
//

import Foundation
@testable import DirectoryApp

final class MockRoomRepository: RoomsRepository {
    
    var roomsRecords: [RoomRecord]?

    func getRooms() async throws -> [RoomRecord] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    
    func enqueueRoomsRecords(roomsRecords: [RoomRecord]) {
        self.roomsRecords = roomsRecords
    }
}
