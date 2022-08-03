//
//  GalleryRepository.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22.
//

import Foundation

final class DefaultPeopleRepository {
        
    private let networkManager: Networkable
    private var cache = NSCache<NSString, NSData>()

    init(networkManager:Networkable) {
        self.networkManager = networkManager
        cache.countLimit = 100
    }
    
    private func getDecodedResopnse(from data: Data)-> [PeopleResponceDTO]? {
        guard let peopleResponceDTO = try? JSONDecoder().decode([PeopleResponceDTO].self, from: data) else {
            return nil
        }
        return peopleResponceDTO
    }
}

extension DefaultPeopleRepository: PeoplesRepository {
    func getPeoples() async throws -> [PeopleRecord] {
        let  apiRequest = ApiRequest(baseUrl: EndPoint.baseUrl, path:Path.people.rawValue, params: [:])
        
        guard let data = try? await  self.networkManager.get(apiRequest: apiRequest) else {
            throw APIError.invalidData
        }
        
        guard let peopleResponseDTO = getDecodedResopnse(from: data) else {
            throw APIError.jsonParsingFailed
        }
        
        let peopleRecords = peopleResponseDTO.map { $0.toDomain()}
        
        if peopleRecords.isEmpty {
            throw APIError.emptyRecords
        }
        return peopleRecords
    }
    
    func getImages(for url: String) async throws -> Data {
        if let cachedData = getImage(url: url) {
            return cachedData
        }
        let  apiRequest = ApiRequest(baseUrl: url, path:"", params: [:])
        guard let data = try? await  self.networkManager.get(apiRequest: apiRequest) else {
            throw APIError.invalidData
        }
        saveImage(url: url, data: data)
        return data
    }
}

extension DefaultPeopleRepository: ImageCacher {
    func getImage(url: String) -> Data? {
        return cache.object(forKey: url as NSString) as Data?
    }
    
    func saveImage(url: String, data: Data) {
        cache.setObject(data as NSData, forKey: url as NSString)
    }
}
