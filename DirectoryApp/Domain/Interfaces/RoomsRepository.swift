//
//  RoomsRepository.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22..
//

import Foundation

protocol RoomsRepository {
    func getRooms() async throws -> [RoomRecord]
}
