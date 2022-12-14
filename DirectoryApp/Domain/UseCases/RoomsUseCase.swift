//
//  RoomsUseCase.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22.

import Foundation

protocol RoomsUseCase {
    func execute() async throws -> [RoomRecord]
}

final class DefaultRoomsUseCase {
    private var roomsRepository: RoomsRepository

    init(roomsRepository: RoomsRepository) {
        self.roomsRepository = roomsRepository
    }
}

extension DefaultRoomsUseCase: RoomsUseCase {
    func execute() async throws -> [RoomRecord] {
        do {
            return try await roomsRepository.getRooms()
        }catch {
          throw error
        }
    }
}
